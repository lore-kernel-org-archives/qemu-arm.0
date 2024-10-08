Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp130716njl;
        Tue, 8 Oct 2024 04:54:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCDqJm3EyVZD0A3qfvi8PWpeI6Db1+hnkqWWfRP+E9Khc+jqT3oP7CzIXKtYwzBJGNPvrJZQBnCaTVIw==@linaro.org
X-Google-Smtp-Source: AGHT+IH+GwOEdI6lLOnJIydUfMAXdAYyrLygzAhSKXdtw9j0wWkks1Pkis0YvcFWQzVseIpFAyWh
X-Received: by 2002:a05:6214:5901:b0:6cb:52dd:44cd with SMTP id 6a1803df08f44-6cb9a440fb7mr249721156d6.25.1728388448218;
        Tue, 08 Oct 2024 04:54:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728388448; cv=none;
        d=google.com; s=arc-20240605;
        b=gffUO6mDFgA1scBRqqBR+48/t2TouSxQipkpWKLIfKuVMspr8/aKWA2JFCb2wNyqNn
         gAZZAITI2JoBBE1YZ+OQ+U3aVbaRdGlzXKFmF+vwnKZGJ4g3LeYrpV3dCAcRgk616pHJ
         16grGiizPlrNWSQKkKna8LReqBnv3BDr91MKFwvcHKszuGLAoKkLTKl+F4DGSXxtPUj7
         f2eaN2BJ69lJ9IptPSer4RAAoDxBDvTnRsY8IYCB4lpS7EfRxAHUYH2r+gW6JpAvRSYA
         hrGBiN8mj8GmRxMEzzoYPTsAkiCQyZhqvsGdsRHe067q7bcXwbzvKY3Xo54q5ppS6S5n
         wbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LtlSqfPrHMDVflzhJjREaxeo7iWi5684iejiLQUms4U=;
        fh=bRBcc2mOUPqSyzwoIO0yKCtQlRLUvBsi7LWr38NTtQc=;
        b=hDeErX2z1Ppqgwfl4G5MYJRC6EykkfgTrT2Tucg3D5RS7Nt6XvpQOzdY5hR5QC2YSm
         YABj+3brLOV986mMhbAUJWWoQRRZ8lfugM1l61ceA5Vbp0C3ywAMGy7QdN4/wYD8Tp36
         KgvYaFwtZ6BiuOG+BY1p5tgmLt3/fSSKOx2o/0codzayu9LEaT5xBmM39XlufcCEsz/K
         E4RvXuujJ8nGBAPbCo4ATKuRi8veFmuEBkmrbCzT73kIlbk7tx3A2Tn+PXKMOpNdaXts
         7rIMHfK+qy458GQjw7Wcd5nRTvaYoDelEXcUtdE4F9iATBeIX0slZTyYXGKQF0/2f2pV
         z8Gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UYYz2BrC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cba478ba17si84018986d6.448.2024.10.08.04.54.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2024 04:54:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UYYz2BrC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sy8mY-0003wX-4L; Tue, 08 Oct 2024 07:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sy8mV-0003w8-Fp
 for qemu-arm@nongnu.org; Tue, 08 Oct 2024 07:53:36 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sy8mT-0002Fk-PH
 for qemu-arm@nongnu.org; Tue, 08 Oct 2024 07:53:35 -0400
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso56429021fa.0
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2024 04:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728388411; x=1728993211; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LtlSqfPrHMDVflzhJjREaxeo7iWi5684iejiLQUms4U=;
 b=UYYz2BrCAODlfsfrOK3Bzd+XuzHkB9d5N0sRTVkgp+aaxiA4y6OQWJQiHMBVZWXISQ
 T4liHurJxFVQaZlJ4L6QWdKGkYYY778Omv2yA03FP1WGa8fW0jgZRufTgxxDHsYxpmr6
 ddHypP3B2h17sVUCuyz2OcnZaSSbuobwYGCwKM8cmuA/DYY8vsW5nYdoQyIBiGZqezv0
 /ljkQHm1bXIrI71laL/QY6ycc787LeHFOe+lDrDbAuFZNhq00HVQJlc+EFTl08MfcYSR
 qHlMcfC/mkM9ZWiOKQ6d1WE99fg9DRwnur1xTqDkZ+LRAcbM/u/7+AUn53L5K3s8Z6Rd
 4R4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728388411; x=1728993211;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LtlSqfPrHMDVflzhJjREaxeo7iWi5684iejiLQUms4U=;
 b=irTpY3dV33HjfVKGHGycT1rBsDkB1vMY/yTw2/OWmDqoLPHxUEMOIQNNfw7GCOs2F+
 YVaAl+6wYbxMLOx9ckRCFoA8yQ37l4ozdcvAa7yeiAIAridF6k/d+YmIv6WLL8CQ/pO9
 HPUAabOYWoSHHekg1YxyH+ZKhKor+W8sbLvT3pHMAcIKF2DEVCHjquLOTFOvCk/rJKIb
 aZVgyf6RrPy6odkIFdSsBro+OogwXCd7LCoXLWMtpJgdc6HPfZOX+DLKj7Y3GE9ESJWc
 gtAyOxek+stwaN8+eiNYsDiF/7NaSv9xJJCUfFV/dNJ8/4+pKzPq+AtDFAUPndFPWXro
 EflA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4Qtp9TY3V5dCF7qJhEkq2XUx4xMbNBcAg7dDdPFFnoZUposvGtwNJXRNUnqTzhtNHpmxDDHSfYg==@nongnu.org
X-Gm-Message-State: AOJu0YyfuL1x+yNHKzz9SADVSNbPo6QdOjsIc5QGfMfUrqEUCIc0kNlm
 w70RLwSBIc65KREF2NxJ/DfW/flcd7zFSB26R47NHWyitSkJWwsrCVCrZPVG5yiFPvV9yrmUNfh
 ZVBXU9Ah43lrc4KlgZiwxYDVAD7s/9Cav0A5N5A==
X-Received: by 2002:a2e:4611:0:b0:2fb:dc2:21e7 with SMTP id
 38308e7fff4ca-2fb0dc2283fmr11981791fa.45.1728388410855; Tue, 08 Oct 2024
 04:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240927183906.1248-1-annie.li@oracle.com>
 <20240927183906.1248-12-annie.li@oracle.com>
In-Reply-To: <20240927183906.1248-12-annie.li@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 12:53:20 +0100
Message-ID: <CAFEAcA_Hnc84gKDnJgq6jbjNegJVcJUUAqTuSp99fvqoekBJSA@mail.gmail.com>
Subject: Re: [RFC V2 PATCH 11/11] arm/virt: enable sleep support
To: miguel.luis@oracle.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, imammedo@redhat.com, 
 dave@treblig.org, mst@redhat.com, anisinha@redhat.com, 
 shannon.zhaosl@gmail.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 philmd@linaro.org, wangyanan55@huawei.com, zhao1.liu@intel.com, 
 pbonzini@redhat.com, richard.henderson@linaro.org, eblake@redhat.com, 
 armbru@redhat.com, annie.li@oracle.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: isZtg2PVkC1q

On Fri, 27 Sept 2024 at 19:40, Annie Li <annie.li@oracle.com> wrote:
>
> From: Miguel Luis <miguel.luis@oracle.com>
>
> For reference: qmp_system_sleep relies on wakeup support delegated
> by qemu_wakeup_suspend_enabled() hence the need for calling
> qemu_register_wakeup_support(). With this, we should be able to
> issue QMP system_sleep command now.
>
> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
> ---
>  hw/arm/virt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 6be80f042f..370ee4fe7f 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2403,6 +2403,7 @@ static void machvirt_init(MachineState *machine)
>
>       /* connect sleep request */
>       vms->sleep_notifier.notify = virt_sleep_req;
> +     qemu_register_wakeup_support();

On i386 the machine has a MachineClass::wakeup method
(pc_machine_wakeup) that does things on wakeup.

On ppc/spapr there is this comment before the call
to qemu_register_wakeup_support():
    /*
     * Nothing needs to be done to resume a suspended guest because
     * suspending does not change the machine state, so no need for
     * a ->wakeup method.
     */

I think that for Arm we need to determine whether the virt
board is like i386/pc (need to do something on wakeup) or
like ppc/spapr (don't need to do anything on wakeup). If the
former, we obviously would need to implement the
MachineClass::wakeup method; if the latter, then we
should have a comment explaining why there doesn't need
to be any action taken on resume and therefore the machine
has no wakeup method.

thanks
-- PMM
