Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp917957ejc;
        Fri, 26 Jan 2024 06:43:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWx8MSZSKRIc9tgeh8277epDlZlzrOv7KZ9TXyZRyz6OzZvLkzfCj079rOAyL69R7Pe52b
X-Received: by 2002:a05:6214:d0e:b0:681:5ed0:e82a with SMTP id 14-20020a0562140d0e00b006815ed0e82amr1519373qvh.98.1706280234485;
        Fri, 26 Jan 2024 06:43:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706280234; cv=none;
        d=google.com; s=arc-20160816;
        b=Ub0Fblk38sd87/yn3hHIngCo9hSJ6pFIRVqGcQ04VsVJcGho7EyazXChAY5oexrHBJ
         gkx1qyhQ/S8quz+HzS8F2DhOXmG7BGCQNvEdOWSvqAw0K1oyypcB26HW94JxKGnHePk9
         WBLmc16Lo2Bn96trZM4aYUpgwEA1l5dASDznfmTB4LvM1yG4Hq+PE3jSWfyVXtjHHTls
         Vq1y3PUitYsokFcKbE12Umx4vsjQFVCXd8/PaQTtkNOPmJKmg7fmeEaUDQ0FnaKs9t77
         Aixl4ecj258z2W3r/3RWDvbm3kT7v3mxVZOUkp+BC7K7PL7plK4CF6eU/dhG7mZElxpd
         rQbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=EhLQSD7+BW8XOT2H7obLO80KK16iLrWUr/ASvWBkRuk=;
        fh=gRp1QxE089AJ9fRIUEpMD9ebRUfn98E0/0SYZHZTyB8=;
        b=MxmAdOCcMH1i5wbid5oKzXUhfRqkWtEfdUBud21OfuBQ6GyEhL1upjROQBmrYvjYtV
         ggYeHhF0vavPHhq2DVFems16Jsjt59jf4m+3NSS+UqQCoLmMB5HvtkqOCjoe5S0hmcRB
         GMkskdowVCFc+bDyNmvWO7yNIEzo+eQ2l5QJ5uC4fop33QF1pIYcIAyC9XFr2UcFKp2T
         nd3OPWjZT3PTO8BIdbbfFvcLjjR99K5A8Z+4dV/ZNdfF/BoXrvLuyF44fUnF7uMxgysU
         7pnNWX7GUPbohRmBrkVKCJwzpprY8TWSKGMF4EGwbK2XTung97/RTM6ZNtGHIQxXNa9x
         GimQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BMZGQSvz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10-20020a05621419ea00b0068196db8c9dsi1445241qvc.369.2024.01.26.06.43.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 06:43:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BMZGQSvz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTNQS-0005QJ-Fk; Fri, 26 Jan 2024 09:43:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rTNQR-0005Ov-1I
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 09:43:23 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rTNQM-0001kp-Eq
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 09:43:22 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40e72a567eeso13919115e9.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jan 2024 06:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706280196; x=1706884996; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EhLQSD7+BW8XOT2H7obLO80KK16iLrWUr/ASvWBkRuk=;
 b=BMZGQSvzoOeTntngJ/IEvyrBpzW0wApmUBmM12jDwRt3BGnFKaI06PDYlOd5vD1yuO
 OJBN7PAJTozEyAiPyXM/YVkLbpcnZD5Bs6SZ2nsD1olS6yHCqt2W0V3fKYzL6j3K7w6b
 w4Qceuc56ThSGxmXWtxHE/h+LldImVlgCHEpkOjXX0QVHbbzyOUOJ9BnnSSdBBF0aNko
 rtg8LuapCA+O2M3ue1JCAy4+JW0f5iYQtV3+F20dhzMBFf04JxgKOUxFveChxBo5gmZm
 /gkPONYYvL5h4FbJzV1JQf+WIsHo2jx0gkmuAMsL0sBF2PCNytzkwHtLPWWXB3aTft8p
 Jh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706280196; x=1706884996;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EhLQSD7+BW8XOT2H7obLO80KK16iLrWUr/ASvWBkRuk=;
 b=TxAMdShAeGi8H+mEmZa/IROA9FImsWUGZPcPrJ0RBMMDOTHivN6fpfZ39odn6IogIi
 0q+G/vkjSH57WusMbfI5Ax8NNkUK9xG+CER+GtiCuJdXE+L6/t8HRSeP23V1VQlE3hxo
 GWAJIo81lFDdRWiZDeuM+5KFG9qs5utj0N440y7Qsz2gZyjqaZXZbVpo6HG2JUwLGWmu
 N2WTkXrEIsqOEhSacLHFMA5KfnziZGPVeNv0rBICzNVCyJHKMbrAKtlUCawcPPj2A3jn
 NhcPlgcnNcCSONRSTYWCEZiK2gTianSCbrdy8LAlpz6/yPqow/2IDRWPpI5Z652ZVDG7
 HsMQ==
X-Gm-Message-State: AOJu0YyxyKpTQKcxbneYj/UIzelPlsX6w0W96Xvx7WuWKRCEnssteWlS
 CmMNZ0ouljYJKy/lPJmD/tJfDFpoIhW1voxaIpY1GVwLfVQ2Qn5VS4RDUZnmwLfL8malwE/iJt/
 mlYGZEIsZBxxL447Ach5iYngeCh+/bSY24oP6jQ==
X-Received: by 2002:a05:600c:1992:b0:40e:5577:189 with SMTP id
 t18-20020a05600c199200b0040e55770189mr568615wmq.147.1706280196041; Fri, 26
 Jan 2024 06:43:16 -0800 (PST)
MIME-Version: 1.0
References: <20240108204909.564514-1-dwmw2@infradead.org>
 <20240108204909.564514-2-dwmw2@infradead.org>
In-Reply-To: <20240108204909.564514-2-dwmw2@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jan 2024 14:43:05 +0000
Message-ID: <CAFEAcA8JtnXezmo-h-rFZcbqsN_-CnOYCTUfLfd_q=F0702U9g@mail.gmail.com>
Subject: Re: [PATCH v3 01/46] net: add qemu_{configure, create}_nic_device(),
 qemu_find_nic_info()
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, 
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, 
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Helge Deller <deller@gmx.de>, Paolo Bonzini <pbonzini@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Song Gao <gaosong@loongson.cn>, 
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 Jason Wang <jasowang@redhat.com>, Jia Liu <proljc@gmail.com>, 
 Stafford Horne <shorne@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Magnus Damm <magnus.damm@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, 
 Paul Durrant <paul@xen.org>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, 
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: L4A+pDuz2D4T

On Mon, 8 Jan 2024 at 20:49, David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> Most code which directly accesses nd_table[] and nb_nics uses them for
> one of two things. Either "I have created a NIC device and I'd like a
> configuration for it", or "I will create a NIC device *if* there is a
> configuration for it".  With some variants on the theme around whether
> they actually *check* if the model specified in the configuration is
> the right one.
>
> Provide functions which perform both of those, allowing platforms to
> be a little more consistent and as a step towards making nd_table[]
> and nb_nics private to the net code.
>
> Also export the qemu_find_nic_info() helper, as some platforms have
> special cases they need to handle.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>  include/net/net.h |  7 ++++++-
>  net/net.c         | 51 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+), 1 deletion(-)
>
> diff --git a/include/net/net.h b/include/net/net.h
> index ffbd2c8d56..25ea83fd12 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -207,7 +207,12 @@ int qemu_show_nic_models(const char *arg, const char *const *models);
>  void qemu_check_nic_model(NICInfo *nd, const char *model);
>  int qemu_find_nic_model(NICInfo *nd, const char * const *models,
>                          const char *default_model);
> -
> +NICInfo *qemu_find_nic_info(const char *typename, bool match_default,
> +                            const char *alias);
> +bool qemu_configure_nic_device(DeviceState *dev, bool match_default,
> +                               const char *alias);
> +DeviceState *qemu_create_nic_device(const char *typename, bool match_default,
> +                                    const char *alias);

Could we have doc comments that document the purpose and API
for these new global functions, please?

thanks
-- PMM
