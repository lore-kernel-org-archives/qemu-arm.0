Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp414072wrt;
        Tue, 11 Dec 2018 02:23:55 -0800 (PST)
X-Google-Smtp-Source: AFSGD/V6Tz5Jre062RZ4wHdLPgTOPDI+8JvSzO+E0A214TTyxffcWUNAn4ppKZA+fvFEV+DnjODQ
X-Received: by 2002:ac8:7181:: with SMTP id w1mr15428134qto.271.1544523835128;
        Tue, 11 Dec 2018 02:23:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544523835; cv=none;
        d=google.com; s=arc-20160816;
        b=HWfzJ6u5sEcAl4K+LUXGtZwYzgYYH9SmY3U8FSt+2SrWq2GI/knFZpbJaY3/lqtgr7
         AhHKc97/mkN4+27Be/TioaLCpTtzs0bPE4SkeGwA6tcVxYHCm9idiGSk1z+8+N2cy/n2
         Ry+EfeEyPqCE4GPGnLz6JErlET27rlCYccyQ9ahM8SD9ih4JaKVCRpK2CoEoUryWfcbw
         U/aUBuuHwDkYPmwzUvUrbHRpm6uJSaJn5STW/NDPPlR0KqgpHj71tdnUaoVx+dbGN8RY
         OIwXHeBPaTlM42jOPpRMVmN6fbMnzMr2VhuG1XpgBLJr9sd7vZFTU10sVA+Jezbx9zWy
         KKjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :to:message-id:date:in-reply-to:references:mime-version
         :dkim-signature;
        bh=h6gvpcTHLBlGF0Xn2hXPyyqz8Ca5RpCbq9luO5y6pyw=;
        b=P3Q/V7LuTmHSWZVtZV5zjiCCuQXQur8Au4W2FsMqWAytCGdlxdqPW0JxC0rLZ2h/kS
         0Fo8ZFMk5uSvGsFt21u5JIqc1ee89ufzZ4x39pGdskRfnK5P/ZQ0ke45XEuEIg79D+B3
         J2hwcGchN54P6UCZwgf7fW5L0FIJLW44HKgwq6GEB17If5Wk86SntVPCBKS4gr819yVD
         mt++7YTSOQH7PgvX6UNwfD5XBi0CGXAbEdeHItbscRCc33xwFma52wuFGuJVp2Ygs2q5
         LRhiV2Vw9t+SF1f8rBZP3+805/KQjc6mdJieaA4M08gv0WLzUsySVLx+YKTDStPGSkrh
         6g6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=JNYnV7gm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e10si1594245qtb.330.2018.12.11.02.23.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 02:23:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=JNYnV7gm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37184 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWfCk-0004Cs-KP
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 05:23:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qwandor@google.com>) id 1gWfCd-0004Cg-7L
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 05:23:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <qwandor@google.com>) id 1gWfCc-0007kV-7J
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 05:23:47 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35157)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <qwandor@google.com>) id 1gWfCb-0007is-Qb
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 05:23:46 -0500
Received: by mail-wr1-x443.google.com with SMTP id 96so13487191wrb.2
	for <qemu-arm@nongnu.org>; Tue, 11 Dec 2018 02:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=h6gvpcTHLBlGF0Xn2hXPyyqz8Ca5RpCbq9luO5y6pyw=;
	b=JNYnV7gmt3/nx3fzpqkfLtqNhMMhCUuxKtqk6D/7zVsdwFhtHOsOZqphZviicoFdm2
	LRk2OQO8m/LX6skz6iK3b0LjagkmF5DxXktU/YulXlMxCvwC2a//4mP82QD8nlyFm2WO
	pZo1iltcu3bTIt/w/V87OqhWYkGFTA4/IgEg0UogrjNimJUOtM7licf7NjzrsR3/CZT2
	m+DJpa8uAs+BqiY671wrhvllmMZ34JqCfMMB/nTaubIAf3s/c+w5uB8KmQ3DOKIyGFxS
	LjyLdjqsQjAzuVuuRCchaJFdst4dgjNM1ikNNlUe9DfOytkAvtuufSMoVpdcucL7ej1J
	TvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=h6gvpcTHLBlGF0Xn2hXPyyqz8Ca5RpCbq9luO5y6pyw=;
	b=Q1ICTta+Dam/ydhroAgAKuqdYT3Buohi1ubB2xusPVlDrxk3dN/15W5ksi1B92bbP1
	Tn9N86HnRhLFd98FJAqHZiNTv4GC961IQsZz+hhswBhitYzFwIg0Lghg1nuD6Rqc4jEE
	fl34HyCMjOndbL/EVeuJBPFoPNxi4f9jN8p0jKyOLo8DpvtbVsahPyCxl01naXq3S5Tc
	5cEjYFh1Wxr7W7kgxijpWXHZ/bb0jlf6m8MCAfpb5bw/APrExA1h4ZwPs97met5fq5MC
	0ffZzX3f9l9hQ2t8SJGOjDOIHUCVQwneGV4k/Cl8IiXKgLyE0pjmb+7CevJf4xZEolfB
	6BdQ==
X-Gm-Message-State: AA+aEWYOHSDiuIcWQbVvzzO4x6iEYAmRsC+9/ci464Vwas6DgTZDTc6i
	ZAzUfd4+FMR5BDTbwHpCjgS93mUsmY6J+bCKZ8T8XKzVbR0=
X-Received: by 2002:adf:8b4d:: with SMTP id v13mr12442845wra.282.1544523823936;
	Tue, 11 Dec 2018 02:23:43 -0800 (PST)
MIME-Version: 1.0
References: <20181210183836.20074-1-qwandor@google.com>
	<CAFEAcA9kXXeRkFamN73XREDp4QaokMs3E9TRLThKf4zYufapSQ@mail.gmail.com>
	<CAMKQLNK2J=JsgEch3G-pQ0mjW5B-n8Xc_4PDGHjFs6CfcA2ngg@mail.gmail.com>
	<CAFEAcA9LNUWrW1dePcKh4LLnN9xUKWswWnfjiNN_2JWExCj90A@mail.gmail.com>
In-Reply-To: <CAFEAcA9LNUWrW1dePcKh4LLnN9xUKWswWnfjiNN_2JWExCj90A@mail.gmail.com>
Date: Tue, 11 Dec 2018 10:23:31 +0000
Message-ID: <CA+_y_2Fa3ffTEcmdNgg7iO+A4W1jZVGQb9GX_46jmER=zJsc6Q@mail.gmail.com>
To: peter.maydell@linaro.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="000000000000e79af1057cbc79b8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-arm] [PATCH] target/arm: Implement VI/VF bits
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
From: Andrew Walbran via Qemu-arm <qemu-arm@nongnu.org>
Reply-To: Andrew Walbran <qwandor@google.com>
Cc: qemu-arm@nongnu.org, Wedson Almeida Filho <wedsonaf@google.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ebDQDZr5Md2N

--000000000000e79af1057cbc79b8
Content-Type: multipart/alternative; boundary="000000000000dfd8f9057cbc799a"

--000000000000dfd8f9057cbc799a
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Dec 2018 at 22:05, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 10 Dec 2018 at 21:32, Wedson Almeida Filho <wedsonaf@google.com>
> wrote:
> >
> > Hi Peter,
> >
> > We put this together months ago and hadn't kept up to date with the
> changes here.
> >
> > We're happy to see that support has been added for the VI bit. Is it
> going to be available in the v3.1.0 release?
>
> Yes, that commit is in 3.1.0 -- do test it and let me know if
> there's still an issue in this area for your guest code.
>
Ah, thanks, you're quite right! Everything seems to work fine in
v3.1.0-rc5, please ignore this patch.

--000000000000dfd8f9057cbc799a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, 10 Dec=
 2018 at 22:05, Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.or=
g">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Mon, 10 Dec 2018 at 21:32, Wedson Almeida Fil=
ho &lt;<a href=3D"mailto:wedsonaf@google.com" target=3D"_blank">wedsonaf@go=
ogle.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Peter,<br>
&gt;<br>
&gt; We put this together months ago and hadn&#39;t kept up to date with th=
e changes here.<br>
&gt;<br>
&gt; We&#39;re happy to see that support has been added for the VI bit. Is =
it going to be available in the v3.1.0 release?<br>
<br>
Yes, that commit is in 3.1.0 -- do test it and let me know if<br>
there&#39;s still an issue in this area for your guest code.<br></blockquot=
e><div>Ah, thanks, you&#39;re quite right! Everything seems to work fine in=
 v3.1.0-rc5, please ignore this patch.</div></div></div>

--000000000000dfd8f9057cbc799a--

--000000000000e79af1057cbc79b8
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIS6QYJKoZIhvcNAQcCoIIS2jCCEtYCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghBPMIIEXDCCA0SgAwIBAgIOSBtqDm4P/739RPqw/wcwDQYJKoZIhvcNAQELBQAwZDELMAkGA1UE
BhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExOjA4BgNVBAMTMUdsb2JhbFNpZ24gUGVy
c29uYWxTaWduIFBhcnRuZXJzIENBIC0gU0hBMjU2IC0gRzIwHhcNMTYwNjE1MDAwMDAwWhcNMjEw
NjE1MDAwMDAwWjBMMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEiMCAG
A1UEAxMZR2xvYmFsU2lnbiBIViBTL01JTUUgQ0EgMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBALR23lKtjlZW/17kthzYcMHHKFgywfc4vLIjfq42NmMWbXkNUabIgS8KX4PnIFsTlD6F
GO2fqnsTygvYPFBSMX4OCFtJXoikP2CQlEvO7WooyE94tqmqD+w0YtyP2IB5j4KvOIeNv1Gbnnes
BIUWLFxs1ERvYDhmk+OrvW7Vd8ZfpRJj71Rb+QQsUpkyTySaqALXnyztTDp1L5d1bABJN/bJbEU3
Hf5FLrANmognIu+Npty6GrA6p3yKELzTsilOFmYNWg7L838NS2JbFOndl+ce89gM36CW7vyhszi6
6LqqzJL8MsmkP53GGhf11YMP9EkmawYouMDP/PwQYhIiUO0CAwEAAaOCASIwggEeMA4GA1UdDwEB
/wQEAwIBBjAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwEgYDVR0TAQH/BAgwBgEB/wIB
ADAdBgNVHQ4EFgQUyzgSsMeZwHiSjLMhleb0JmLA4D8wHwYDVR0jBBgwFoAUJiSSix/TRK+xsBtt
r+500ox4AAMwSwYDVR0fBEQwQjBAoD6gPIY6aHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9ncy9n
c3BlcnNvbmFsc2lnbnB0bnJzc2hhMmcyLmNybDBMBgNVHSAERTBDMEEGCSsGAQQBoDIBKDA0MDIG
CCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzANBgkqhkiG
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
BgEFBQcwAoY0aHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NodnNtaW1lY2Ex
LmNydDAdBgNVHQ4EFgQUjOqjviYWNDzbpIZA9rXUhQD/PI4wHwYDVR0jBBgwFoAUyzgSsMeZwHiS
jLMhleb0JmLA4D8wTAYDVR0gBEUwQzBBBgkrBgEEAaAyASgwNDAyBggrBgEFBQcCARYmaHR0cHM6
Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wOwYDVR0fBDQwMjAwoC6gLIYqaHR0cDov
L2NybC5nbG9iYWxzaWduLmNvbS9nc2h2c21pbWVjYTEuY3JsMA4GA1UdDwEB/wQEAwIFoDAdBgNV
HSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwDQYJKoZIhvcNAQELBQADggEBAJT+kOPyEAkypy9d
Kvgp0tQqYnr9tB8GXBAFwVcBp65D9h/5CDqLyMV09pZx6Jt/KfEwGeaAy7go/KIuUFueEaWVeDdM
alZPMuoVZABJ1fIsMOFlbmK0k2WwMlvWxKAOr1KIUkSgjtTqy+nEwHNU4e9U/ECXqkChMCv0gLVK
VaS9gHvwegDzmPZTljNy19eua7qaEAqJg/m01Ph9J3S91hKc6jaNeM3d06dAXlY3E1Y6qc9NiERw
gGBFJQs4fHifgtqf+YGoo+SXWONQdjG+0Dguyn9GkK76O7uyL3TZWAuNW6qptURaYW5Fl3S4anoi
PfSZCMuXCj2LGgUUKa5GZLQxggJeMIICWgIBATBcMEwxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBH
bG9iYWxTaWduIG52LXNhMSIwIAYDVQQDExlHbG9iYWxTaWduIEhWIFMvTUlNRSBDQSAxAgwe6rFI
XyvxfCITQFowDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIBpdrVOUcOe+C5s9vinm
qcLvmNul1Cgkqh/1rYZeubOVMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkF
MQ8XDTE4MTIxMTEwMjM0NFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUD
BAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsG
CWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBlax1UEosSFpBbkuRhbd8NxK4iviMmqORDs2nb
Dkv1I+2DmPAWHo/dyZKZvpGL9opadBbvE5jnuX7X8vYfOGQv4dCFA7XHk7TPeO3NRxjleeRzUwmq
vWpFdnwA0WU2HCJdhQfoWt7bcuHb31XgiSeIhalZ0WwZa32oXxOfC2xaogwXpoB34ngD1LLmXydU
2K5gwdfHyaOxzpwaXc/pbhmJJrBKxlxFdiY2NLv+rUFMKC9R/IJaHPzRJRfwjyeulpkzaqFyB088
/i4IO31HLjiCCZqKLKEG2LJVRYMfnQJqliEniGfAD8Y40JFcLMlfNWIssfgYO9H8NirKW092nx/w
--000000000000e79af1057cbc79b8--
