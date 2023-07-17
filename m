Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp5726341eje;
        Mon, 17 Jul 2023 07:07:52 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFVh8nkvUCIe0Kahw7vVDjCIreG2OyWyNZyAv+OtoJVCan0To76I0tD40P8yrnHyKySII7E
X-Received: by 2002:a05:6214:11a2:b0:626:1995:8d2d with SMTP id u2-20020a05621411a200b0062619958d2dmr11230880qvv.47.1689602872432;
        Mon, 17 Jul 2023 07:07:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689602872; cv=none;
        d=google.com; s=arc-20160816;
        b=oeNpRPKAZmCOF1GMfZ0nHUF05su9bW/RIgZyr4N0Qlp+i8nrn0bDUBNaDU87fzoJx6
         2XUujduoqDFq/xPyJX5P2UwNwe7e4IqkAGLwUW+wi1YKj88QR6q6tj7y6pIdCcUpe145
         O9S8lB6RPL55tIWI8oNT3JXHSOTGcd+M6J8uZo6Aqgp+Wahic5XjVKmUx437wwTNP7wm
         bV5J1iN5p/dBOvvK3MEratB+bFzke/6Od/3TbS1ubm8HNlJxDOvBbqsqwVEBUmp0IK4v
         vCa7VEXyXnpJoLg99nSVRKdNhwwHjsR+mG4Lf6gmE8TwnJdfcm+OsKVtdgyzZJAPL9JX
         pWuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=OQmZYLlSbKr48zuQpecmTcFGAvgvUC3EvImMUBOtai4=;
        fh=S9d9+cYM2rc/WbJnKEbgQuqXcWPyg8m+jSDgJf6rcMk=;
        b=DZ1A5m9LNGrp225l6v/F+b6Wn4pS8SjKTk9s6GP371UZIGLsc8AcWEh0fH6n6xk1XE
         CiN4GBHG4mxUhqbKaflVhoDt1kKSWAFuPK61B7ow9By85lwf2EHR36fNuauaQx2EmvCT
         m96ut2Q3ek3xtHpRa5FunpxQM6n7RVhV4V5mM1qHep0NdwzRK0h2em8CkygS9bIGbyIt
         0pkTzeHGHoVu/lPXEZNurb1mx1KPWkC4nz7V3EL+wDj/NNJz0zBVfhrpMUtHX5+4mjBn
         pzZh1eHLiIH/wiC81/MiZkqL19tyU2r+bMBYxRsmZaCHFaJ4sNUJ+azcIaIzc/0RXRZa
         PJFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="edY/YzuB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x26-20020a0ca89a000000b0062de0aeba43si8078801qva.147.2023.07.17.07.07.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jul 2023 07:07:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="edY/YzuB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qLOsz-0004nT-QS; Mon, 17 Jul 2023 10:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qLOsy-0004nC-Ap
 for qemu-arm@nongnu.org; Mon, 17 Jul 2023 10:07:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qLOsv-0007BE-Ip
 for qemu-arm@nongnu.org; Mon, 17 Jul 2023 10:07:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689602828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OQmZYLlSbKr48zuQpecmTcFGAvgvUC3EvImMUBOtai4=;
 b=edY/YzuBvPiIKbmKzq3MXNTyUVeYglsHBuKMD4vHRvylj7gxn+OJL0rjaE26u82N7RM5a6
 hHvabbjOtF5lhufnbR1BEzzyW9Xz3ku+wrIRj4PWLAatRgmSMCd6HFqKtsophdVCSA2Y+o
 Q6ZBurNR/cYDOsF3ILP4DVfOSj3/zcY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-IzB5mSKKOdmpjuhT9YQCkw-1; Mon, 17 Jul 2023 10:06:59 -0400
X-MC-Unique: IzB5mSKKOdmpjuhT9YQCkw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-994320959f4so256128866b.2
 for <qemu-arm@nongnu.org>; Mon, 17 Jul 2023 07:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689602807; x=1692194807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OQmZYLlSbKr48zuQpecmTcFGAvgvUC3EvImMUBOtai4=;
 b=YOhK7s/Cv9C8HmV+6u5d3x/QsE25PF+bhlfQbz0EKd8To4r8sAkA416jyYVMtJIYuM
 OXZ/z88X8MZORR4DpBuGNfe2lnuEt24PaZF3JvO4Plk6XbdptCxEmJTkhHD3NrppMiBG
 KzDxVd+6OJx1Fhyag7ua9QdjXqvZxAtfMWD7VtV9eZQMH1HpmRg7G40kytQLFWiFSJDg
 fVy/mmKHi8byLkkqgzacHL0vQP+iMstR7FkZpYic/E9kUTFU/83bP5qKGvFBS9vBjZf6
 l3MdU70mNY3nt+CIcfYMPMltGD7n6oVo+m7nfDC3OrJVKdWx19qHhT4O2tyMdwmFHGfn
 VSyg==
X-Gm-Message-State: ABy/qLY+s9bBH+VYKV5M3etzaDuh6Ivbw0F7ouDiZ6GB9iwNITGh8VyH
 obwfP+30Z7T2+wnwV6YcjP6EIUvceXBESq9g1wgqobtfPWYWyCw59QxGSrjsqRX0svcFKSVfj3J
 SinNpMdkLk1HE
X-Received: by 2002:a17:906:2d3:b0:997:865a:77e3 with SMTP id
 19-20020a17090602d300b00997865a77e3mr5765974ejk.11.1689602806903; 
 Mon, 17 Jul 2023 07:06:46 -0700 (PDT)
X-Received: by 2002:a17:906:2d3:b0:997:865a:77e3 with SMTP id
 19-20020a17090602d300b00997865a77e3mr5765957ejk.11.1689602806632; 
 Mon, 17 Jul 2023 07:06:46 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 q3-20020a1709066b0300b0099290e2c163sm9141392ejr.204.2023.07.17.07.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 07:06:46 -0700 (PDT)
Date: Mon, 17 Jul 2023 16:06:45 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joelle van Dyne <j@getutm.app>
Cc: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org, Shannon
 Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani
 Sinha <anisinha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, "open list:ARM ACPI Subsystem"
 <qemu-arm@nongnu.org>
Subject: Re: [PATCH v2 09/11] tpm_tis_sysbus: move DSDT AML generation to
 device
Message-ID: <20230717160645.3416d6f0@imammedo.users.ipa.redhat.com>
In-Reply-To: <CA+E+eSDinJuo8xyZTzfqKXr=rf+fyjkvOLVEqam0eapehQ1OYA@mail.gmail.com>
References: <20230714070931.23476-1-j@getutm.app>
 <20230714070931.23476-10-j@getutm.app>
 <d3d3d9d0-fb88-9500-34d9-9780f9c2644f@linux.ibm.com>
 <CA+E+eSDinJuo8xyZTzfqKXr=rf+fyjkvOLVEqam0eapehQ1OYA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tGsAC+Gqufov

On Fri, 14 Jul 2023 10:29:31 -0700
Joelle van Dyne <j@getutm.app> wrote:

> On Fri, Jul 14, 2023 at 9:19=E2=80=AFAM Stefan Berger <stefanb@linux.ibm.=
com> wrote:
> >
> >
> >
> >
> > I don't know whether we would want multiple devices. tpm_find() usage i=
s certainly not prepared for multiple devices. =20
> Sorry, "multiple TPM interfaces" here does not mean "at the same
> time". Will clarify the description.
>=20
> >
> >
> > Good for the consolidation.
> >
> >
> > Does moving the TIS to a different address help on aarch64? =20
> That was the first thing we tried and no it doesn't help.
> >
> > Can the size really be an option? I don't see it useful and if one gave=
 the wrong size it may break things. =20
> It was added for consistency (otherwise we have to determine the size
> by looking at the interface everywhere). Also, it is possible for the
> size to be larger than the constant. For example, Apple Silicon uses
> 16KiB page sizes and we may decide to force the device to be 16KiB
> aligned (not sure if this is needed yet while we still track down why
> the dual mapping was not working). In that case, we would need to
> inform the OS of the true region size to prevent any overlap issues.
> Both baseaddr and size should be provided only by the plug handler in
> the virt machine, otherwise things may break even if we get rid of
> size and have just an incorrect baseaddr.
>=20
if properties  (address/size) are for internal use, it would be better to u=
se
x- prefix as not give user false promise that user can expect them working =
if
they provided them.

> >
> > =20
>=20

