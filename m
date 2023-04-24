Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2685028ejm;
        Mon, 24 Apr 2023 02:29:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350YQAN9GVA/BejamcUSOyZY3V0nG7w805YfXAxXVqwD8hDOQJDgnOJeYRHBADFnw/6AN190v
X-Received: by 2002:ac8:5c45:0:b0:3ba:1113:751a with SMTP id j5-20020ac85c45000000b003ba1113751amr22253894qtj.67.1682328547005;
        Mon, 24 Apr 2023 02:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682328546; cv=none;
        d=google.com; s=arc-20160816;
        b=FpyrZWdn0sAa12pj5X1pvnWHrEBpp2X8KFlggBjkZkByYziSWhmiitWPS69i9bpgFc
         zIKFROH3qHQhUlmBnZ9nb3yGliIPATBZ6im5aM4u+ZthyCx9TntxmnNS3H21ZEzvW/ff
         a/kZRTKHSlYg58AxtWbuHIIyBCXPenGtFaYaX917e0AD7WGRnKs/0dmHHJzRJlekqORd
         z9brDjJxNJM9tip/thXTDK/e0fk8+f8RrEytLlNH89GXvIAnH18URC9sxb56e/rcH2R7
         Ge9Czc6hbpB8WVFvfqnyH+zBkfylLwh4Xhs4WkLyKnuJ/WHi1RPyNpnsaeNhiWJNl/Au
         gW2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4aEXJmczxLXUjgXfVtfrGKjMhk25dJWX4NT5N+vfZ7c=;
        b=bb/CBtRb3ly2PajYWf/xRV238WUQYsRTq7cjopQ0HldIQ/kGjbq4duSqMUEbNJnp0F
         IknaManqjRBuz1sXu11BDwvEzs8xfR/ol4ynk/EC8Fr8BKJAtIwQ9odOOEh92EzKMtv0
         uwxcC6/tpX5N/JpH5+rwv2EWBiWIV2tEdTFjhBo5bG61WZUui6baqk69kFYR46pdq5U7
         fFnVV2unxg0/ecndsC0EyQWIj0pum9RUSd5CL5oMfzLx+pMXUuRch2XQ5Q+SUtBaCa9X
         jOIOYAo8zUwyOXlWHV5Wajqij7c+pB5Gc4ZTdwOoQJ5yYM9BKL3Fh2vYsYw/IEZmVD0/
         khPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LdO9+j4G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l20-20020a05622a175400b003f032d81707si1728884qtk.370.2023.04.24.02.29.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Apr 2023 02:29:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LdO9+j4G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqsVD-0003OD-66; Mon, 24 Apr 2023 05:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqsVA-0003IY-RF
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 05:28:52 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqsV2-0006Vb-6M
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 05:28:49 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-504efe702d5so6020875a12.3
 for <qemu-arm@nongnu.org>; Mon, 24 Apr 2023 02:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682328522; x=1684920522;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4aEXJmczxLXUjgXfVtfrGKjMhk25dJWX4NT5N+vfZ7c=;
 b=LdO9+j4GmOndnjnyDkhM988mOzeZRV2h4qTUPoac69zfW+X3Jntxiqei8Z9wYAmmNb
 KXSXTEgrVdEmIzlip1Uuf0/DXZqtp71q2QphUfZON84YfshPYpagm/0worVGZ2C9cMJ9
 esjGff0lNAq0lN7EN3xuH2+8jeKXXSL1aQ2dR1q1e4U+V0YcKIreFiFHvQ2LwVI8UlIB
 jsHhEpAXNdZSXEE/T0FfLrExNmjIrTlxshBrIxlDWMyHk+U8heZBC93XS97BwFwsXtu/
 pSox56gyOMvHpxOhSxL0kmZsCPL6VqA6e4KErgxQ0IQmzYdCS6lU0n2cF2Cmn34+eQkH
 JeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682328522; x=1684920522;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4aEXJmczxLXUjgXfVtfrGKjMhk25dJWX4NT5N+vfZ7c=;
 b=WSrExHrPfanC2IjnrcZz9HCoyF7CEGl+NBdub+l4RGl8SW2KSwvI39v84cT6Mu3W0t
 T0lI7RLZffzyvh3UWWZrd4FNd/c49KgHq9CzaBMHpsBiUxtCbqhbnZajh9vZIV00JVAO
 f1/AcZ1l8o4br6q2IBmBlsJN6y5roF+nQNz2eooCF82PpQbs1tNZhSY+Xwlo7XsHGOzE
 vIZ17+Qmpe099S2uWwgoTmEW0Z98xIvKU2Wp2tedaYtvCBpw8GPV96W5gE+kxQNENXT+
 foOuyohbNBxe0l3z9qEbPWJ7XoVak6/Q8ApMclp+uNts1VxRoRxF78WfuPKdDrFTZoPL
 7nnw==
X-Gm-Message-State: AAQBX9cWusH/345hPZ6LEQhGiu1VzEawG8n8G0BTnn4UL1cu1kOm7/mV
 TmVEHaJ7gkyWaLh3my34kzrSnRYxVDOI9/9sICruwg==
X-Received: by 2002:aa7:d3da:0:b0:508:47af:c191 with SMTP id
 o26-20020aa7d3da000000b0050847afc191mr9462094edr.30.1682328521695; Mon, 24
 Apr 2023 02:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230421165037.2506-1-Jonathan.Cameron@huawei.com>
In-Reply-To: <20230421165037.2506-1-Jonathan.Cameron@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Apr 2023 10:28:30 +0100
Message-ID: <CAFEAcA_DB=nNdiMRwn02mUAATKLvV0Nzs2dCYaM+2fwitac5sg@mail.gmail.com>
Subject: Re: [RFC] hw/arm/virt: Provide DT binding generation for PCI eXpander
 Bridges
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Fan Ni <fan.ni@samsung.com>, linuxarm@huawei.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: gVoVzyyfP7ia

On Fri, 21 Apr 2023 at 17:50, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> This patch and the problem it is trying to resolve will form part of a talk
> I will be giving next week at Linaro Connect. https://sched.co/1K85p
>
> So in the spirit of giving people almost no warning... Plus being able to
> say the discussion has kicked off here is the simplest solution I could
> come up with. If we can agree on an approach to the sizing of memory
> windows question by Thursday even better (I'll update the slides!) ;)
>
> This is a precursor for CXL on arm-virt (for which DT support was
> requested). CXL QEMU emulation uses pxb-cxl which inherits from the
> slightly simpler pxb-pcie. ACPI support for these additional host bridges
> has been available for some time but relies an interesting dance with
> EDK2:
> * During initial board creation the PXB buses are largely ignored
>   and ACPI tables + DT passed to EDK2 only expose the root bus on
>   which the section of the PXB instance that exists as a normal PCI EP
>   may be discovered.
> * EDK2 then carries out full PCI bus enumeration, including the buses
>   below the PXB host bridges.
> * Finally EDK2 calls back into QEMU to rebuild the tables via
>   virt_acpi_build_update(), at which point the correct DSDT for the
>   PXB host bridges is generated and an adjust DSDT section is generated
>   for the primary host bridge (holes are bunched in the _CRS).
>
> For device tree bindings there is no such dance with the firmware and as
> such we need QEMU to directly present device tree entries for the primary
> PCIe bus and the PXB instances.

So, not knowing anything about CXL, my naive question is:
this is PCI, why can't we handle it the way we handle everything
else PCI, i.e. present the PCI controller in the DTB and it's
the guest kernel's job to probe, enumerate, etc whatever it wants ?

thanks
-- PMM
