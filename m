Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6F8606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 15:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mvista.com header.i=@mvista.com header.a=rsa-sha256 header.s=google header.b=YXdQGJdj
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMSUZ-0002G4-Us; Thu, 29 Oct 2026 11:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1xMSUX-0002FA-5W
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 11:56:37 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1xMSUV-0007Qc-3h
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 11:56:36 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-8ad98c3fb15so21437407b3.2
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 08:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista.com; s=google; t=1793289393; x=1793894193; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Uc5RrGIjaBleOPi6NAaf7/8Ti1bOWcH1xOjMekYe0MA=;
 b=YXdQGJdjVZlCH/PC0D8p9QFQ616px68Cz9Csudew9RJkIIVvFoLGfWo6GvJXT+PfC+
 tWU/tAkMFjZWBchttuH6+P9ajYRAgMedxDTk8+8sL3hf8kHmG3BRKoipJqK/4KHSOlmD
 lwoWKWVtDy3tV7EEvMPwfjZkK4NC7aHoYwMxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793289393; x=1793894193;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Uc5RrGIjaBleOPi6NAaf7/8Ti1bOWcH1xOjMekYe0MA=;
 b=nI/ULXkn1U7kvmbfjp4GfKQKPT2jtSPpkeFvd6JCfFq2eiyq+uxcvJBmO733vFWNoY
 Y8K++FhYczTvIOaJkHb2yjy+6zQD/UnqYzT8hb7RbaxZuYZ0iXx3nuz69Nvi/NaYSmnd
 /9RmSsZsheiOPSdvWJDn4lb/BkEyx8yF37VUUIy0ZEjaP/JfAiHHq0LZaM03K+rDW3Yl
 7ArSHhl56bP+8kfh6qJ2cNEBPOp0RbHBTk1aHVBHZJHHDdXjFb3mlRe/WP0V9ZGNlOy4
 AhvFRdP09x1onxNM3PnGojgZMBIXwYGaCjIT5MFPDi3OzFNa258cddHMOMbwawLMWC0M
 gevw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxjxjY/Y8GiboOv5UNXQe4OKuBfRMgjsoXTiuhf9zC7SnetRx86kt1gIkyaQY6f1Fpt+DHpBFkAAA==@nongnu.org
X-Gm-Message-State: AFq9FYIIbzYC21GdPAGJWqpoVNZXxW0nF3udeLdFaorKgxamIbv6Acb5
 5wZDk0qMOFvzRpqPesNT6a8GOxUk+x3W/ltPfHPxRFxSrRdYNUNbQMev38M99eHJKeI=
X-Gm-Gg: AYBFou0Wsg4dVPA+8sG3EpCfKpbZT7iZtlHqMz5Nzo/a/BaegsulOsUoqhoBppYoYtT
 BiehRgQ3zfAkuMBljsapwhVa1YTsek9mLjdX2bPK30RnveRGS0cQctQ4taB8CDbuT2+eVacO2G1
 vdgWkNBlBQ99O6Sgh/g4fB5zSp9+rvaGQDHFBrjc260DAbZFSVy/qY8fwgOg4PYM090zw1Z5D+x
 p6pvm6S46W2y5qGKQ7xsup03lUCGWvV9TUqfoUvJHtsz/k5tj1u4G8ugSdbf9EdXDiOj8EH8NCW
 30QfTYE+h9S95jtdap4nudXKViLH4pKfgtCwRM8wMX5YCo6dwShawHiV649qunonf7/wzPmxIyb
 qJlNnc2WhcoUlH7qEpYqm43Z4LFQu188/sf2kBOIiN7sAKR9qc/oT3vWHT2I0RO237Z+o8DJmZ3
 2kAcBSHz3Ki4jssg0dwIFiUE5pHFU9y7RxIBrYp5o/SWKyNwdULi+Z2ztpp557UoP/4rasjsSan
 bagzJ3EGR7ZcIeU4FA9fH26IKObe58rpAV7gXaICnkJ6yJbhJE3du9S4dkmOBoDq0yW//suVLSr
 fLvR6kKtj+Hp7PqTbCjtjbq6sMdP2PyZ3eE=
X-Received: by 2002:a05:690c:288:b0:8b0:e479:6872 with SMTP id
 00721157ae682-8b1b5bcb743mr49623077b3.17.1793289393402; 
 Thu, 29 Oct 2026 08:56:33 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:2f32:e466:d3ef:5b82])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b19e43e1d2sm46265337b3.5.2026.10.29.08.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 08:56:32 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:56:28 -0500
From: Corey Minyard <cminyard@mvista.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Timur Maksimov <gessingate@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Kane Chen <kane_chen@aspeedtech.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2 1/6] hw/i2c: add dummy device
Message-ID: <auNsrMnkbOrtHvE3@mail.minyard.net>
References: <20261027-aspeed-i2c-nonpkt-fix-v2-0-07deed1dff60@gmail.com>
 <20261027-aspeed-i2c-nonpkt-fix-v2-1-07deed1dff60@gmail.com>
 <2629ee8a-e817-4764-a1e3-72e0ccbb978b@kaod.org>
 <874ie6ku2u.fsf@pond.sub.org>
 <5d219f231fb1f97c6d90cbef4068e82dff803a18.camel@gmail.com>
 <87pkwtezsz.fsf@pond.sub.org>
 <c850cbe681b0328cf3c3f93140132f8363e253e2.camel@gmail.com>
 <45822012-fd39-4263-a8de-d66a440d1061@kaod.org>
 <auM__1eixNuS8NMv@mail.minyard.net>
 <334ca0e7-6b24-4bc3-97ca-03e3762c7feb@kaod.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
 micalg=sha-256; boundary="tRhBIqGB9GOQGaB8"
Content-Disposition: inline
In-Reply-To: <334ca0e7-6b24-4bc3-97ca-03e3762c7feb@kaod.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=cminyard@mvista.com; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: cminyard@mvista.com
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--tRhBIqGB9GOQGaB8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 02:04:16PM +0100, C=C3=A9dric Le Goater wrote:
>=20
> > > > I also have a question about MAINTAINERS file. If we keep this devi=
ce,
> > > > where should I put this file?
> > >=20
> > > You can put it under Aspeed for now, since it will be only used by
> > > Aspeed machines for tests. If it grows, I guess we should move it
> > > under "I2C and SMBus" if Corey agrees.
> >=20
> > This seems pretty generic, so I think it makes more sense under the
> > I2C directory.  But I'm fine either way.
>=20
> Under the I2C directory then. Fine with me. There is nothing specific
> to aspeed about it.

Sounds good.  The change seems ok.  I'll wait for the changes
based on comments.

-corey

>=20
> Thanks,
>=20
> C.
>=20

--tRhBIqGB9GOQGaB8
Content-Type: application/x-pkcs7-signature
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIINIQYJKoZIhvcNAQcCoIINEjCCDQ4CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgggpVMIIFXzCCBEegAwIBAgIQD/rh8xorQzw9muFtZDtYizANBgkqhkiG9w0BAQsFADBl
MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGln
aWNlcnQuY29tMSQwIgYDVQQDExtEaWdpQ2VydCBBc3N1cmVkIElEIFJvb3QgRzIwHhcNMTkw
OTIzMTIyNTMyWhcNMzQwOTIzMTIyNTMyWjBqMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGln
aUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSkwJwYDVQQDEyBEaWdpQ2Vy
dCBBc3N1cmVkIElEIENsaWVudCBDQSBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
ggEBAOqxRa06rLwKBvrDb/qQ8RtXfeKA9o0A42oZbLF4GYr4Xdt9JE8r3PJRIOUZD1U3mEln
4S/aZoS54Q+5Ecs3q2GGT/Z82VeAPLeGvJoT0LS5t/zXeUcbMuDFWgyj33kiesnuusnOWvpI
SoxN+oBH4oo0+oUiHI65mMjMAlb93x6sabh9kKvHQvHC4x2u7wYv5+NXjnbOhJS/1NjGq+ug
LMXeldFMz0O5qFIDpn3aQGU0htyJQ2SZyxEqlUrgunsrYj9wgfW7XuhAi2j0y5d9oMT0SuVe
KFFnQhTEk5B3fq+OBOW0AU2JdW1r929UtRbAr8RpLt05WI2G2RNVVlHYaU0CAwEAAaOCAgQw
ggIAMB0GA1UdDgQWBBSlYiBQ3LtbV5etI4814lRsqX75TjAfBgNVHSMEGDAWgBTOw0q5mVXy
uNtgv6l+vVa1lzan1jAOBgNVHQ8BAf8EBAMCAYYwTAYDVR0lBEUwQwYIKwYBBQUHAwIGCCsG
AQUFBwMEBgorBgEEAYI3CgMEBgorBgEEAYI3FAICBgorBgEEAYI3CgMMBgkqhkiG9y8BAQUw
EgYDVR0TAQH/BAgwBgEB/wIBADA0BggrBgEFBQcBAQQoMCYwJAYIKwYBBQUHMAGGGGh0dHA6
Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBFBgNVHR8EPjA8MDqgOKA2hjRodHRwOi8vY3JsMy5kaWdp
Y2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURSb290RzIuY3JsMIHOBgNVHSAEgcYwgcMwgcAG
BFUdIAAwgbcwKAYIKwYBBQUHAgEWHGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwgYoG
CCsGAQUFBwICMH4MfEFueSB1c2Ugb2YgdGhpcyBDZXJ0aWZpY2F0ZSBjb25zdGl0dXRlcyBh
Y2NlcHRhbmNlIG9mIHRoZSBSZWx5aW5nIFBhcnR5IEFncmVlbWVudCBsb2NhdGVkIGF0IGh0
dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9ycGEtdWEwDQYJKoZIhvcNAQELBQADggEBAHZrbCQC
o3MAIqR0kekGYrC70EAGRDRq11COufNEXhcpv3YH6BMhUoVinPPNgfo5HPrZAFrLK/KPXYdJ
dgkASGsINabAfY2ljUaJwKlpIewwjS6KuGEn59MgidaAUPh6lbetIoRsLhCqCzAnX1aL99fj
CMf4NMWLUC8TqotnnrKNuw4JSjx4fcQs+U5T1bbgnyDx+8ybONuIEDvinHdKDu2VjoECzez2
y/1IVTPlh57zBfjHJQFqLWzHdou8M+ucdJtr2swXII6s3nkq4pfEn7KnbzMS9quFSuyOGILc
g/3qVwaHNLM5R+8nB5gPI5+u5Uh56w1i+9Ds1pjYAiTHdeUwggTuMIID1qADAgECAhAImztE
U4o9odkEsuVgiJc8MA0GCSqGSIb3DQEBCwUAMGoxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxE
aWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xKTAnBgNVBAMTIERpZ2lD
ZXJ0IEFzc3VyZWQgSUQgQ2xpZW50IENBIEcyMB4XDTI0MDUwMzAwMDAwMFoXDTI2MDUwNjIz
NTk1OVowQjEcMBoGA1UEAwwTY21pbnlhcmRAbXZpc3RhLmNvbTEiMCAGCSqGSIb3DQEJARYT
Y21pbnlhcmRAbXZpc3RhLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJm1
ZE9brEiQnF7EKiV+aYzHyqPFJ+z1wwdJ4wvNiwUCgXJejBxFj04Z7A62Yx6Sp59vfjbo05eA
IOyaLOFp3vbMBQAe8Qe4XrFv7wPcKZxwS+sgCuBvNs4NVGKYGjiKZW8WPq9ZcEl5BM8BLMrl
rchAUHJJcMdcEJUsed6rIB//EtnGOe74/vR1Tz3sN1WzC1Wa9COvcbLgVvWC/o4WysUfC9+f
9/5JzAiib7U7S/iRigkmEahibZgYKB7y6F1v9hxUwHxfa7GtJ8cv6LtRcPLhAO86GgXMfpgq
k3fxzQu8uwACpINbmQNLcRzg6mHFDYRK3mFp4puUnHO5EUJ8RgUCAwEAAaOCAbYwggGyMB8G
A1UdIwQYMBaAFKViIFDcu1tXl60jjzXiVGypfvlOMB0GA1UdDgQWBBQiHrUOKuj1vJe3OXAz
gOP5Qbl2FTAeBgNVHREEFzAVgRNjbWlueWFyZEBtdmlzdGEuY29tMBQGA1UdIAQNMAswCQYH
Z4EMAQUBATAOBgNVHQ8BAf8EBAMCBaAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwME
MIGLBgNVHR8EgYMwgYAwPqA8oDqGOGh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2Vy
dEFzc3VyZWRJRENsaWVudENBRzIuY3JsMD6gPKA6hjhodHRwOi8vY3JsNC5kaWdpY2VydC5j
b20vRGlnaUNlcnRBc3N1cmVkSURDbGllbnRDQUcyLmNybDB9BggrBgEFBQcBAQRxMG8wJAYI
KwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBHBggrBgEFBQcwAoY7aHR0cDov
L2NhY2VydHMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZElEQ2xpZW50Q0FHMi5jcnQw
DQYJKoZIhvcNAQELBQADggEBADkBdRyx41eUGmsYXBXt3WCsYeDr26rJL7lbx2PvqaZyRCJm
J9CN2TljF0YHsXSPU+un1RfUlYz+PtcNFIqNuSf3N5fGU0bEpSzXozd/nZ32yWFLkd5CzYyN
F1xrpbyP2a87jKM0uqEHXZFl7NPiAfEchjFCddciHTOXjN66L+kJ/ZsOoNJLG8yFN401EGew
Nk8z/hJjWqR7DG0/YWn9h7jQ5SmqkqyhLwTO9s6KoByacWuKpKWSc/DaOuWmROlROrOA1hD8
0sKqC6jGeLxNpiYzSwBy8qKF0weZdhcHUeO1HOm1csrvWl1UghnlR7SLir3bb5LiesTVvSuR
Q3aDywAxggKQMIICjAIBATB+MGoxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJ
bmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xKTAnBgNVBAMTIERpZ2lDZXJ0IEFzc3Vy
ZWQgSUQgQ2xpZW50IENBIEcyAhAImztEU4o9odkEsuVgiJc8MA0GCWCGSAFlAwQCAQUAoIHk
MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MTAyOTE1NTYy
OFowLwYJKoZIhvcNAQkEMSIEIBDJpX9j46ZNMJkgNJDBinetyspPcBoN3TgfEHdpwIdhMHkG
CSqGSIb3DQEJDzFsMGowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIw
CgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUABIIBADq0xo+VSh4+O8AmxV+uEJHSFeASSdWM
VXX/wmGs3E4sFb5F+YHkWDPkKlsmmauAeVVJbqG76Gxgkfvmhcgfox2MCt/1zmM8QEla0NIQ
EzFAdIycqEv/BzWY109MiP4YzvkXL3VZVKF9IWeGblV1iHhjZxdJ2DJ1zoA3HYJt2jKFubQX
SeON9FLxFWldrD5ADUAmyqE2DCOI4ZVEocDUGPxZbz+etqqKWNAzZQmlnAVNfVk1PNiFWif/
997gRgn2qfgCFNje8WsXt25apBcj6qhNLXasgfGLUH8nzgdXmtGatCk9NVQyr6d9PoLm8h9d
Rr1qM7K5/ndiFaIaVdThSHI=

--tRhBIqGB9GOQGaB8--

