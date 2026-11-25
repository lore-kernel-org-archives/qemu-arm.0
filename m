Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F35606A321
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Nov 2026 17:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FopnUpMX
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWH8R-0003I1-1u; Wed, 25 Nov 2026 12:50:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haseebashraf091@gmail.com>)
 id 1xWH8J-0003G2-5G
 for qemu-arm@nongnu.org; Wed, 25 Nov 2026 12:50:16 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haseebashraf091@gmail.com>)
 id 1xWH8H-0004RD-EK
 for qemu-arm@nongnu.org; Wed, 25 Nov 2026 12:50:14 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a5177d78c7so60591505e9.2
 for <qemu-arm@nongnu.org>; Wed, 25 Nov 2026 09:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795629012; x=1796233812; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5p6EFOjA87jcLwyx8NSrFxBVW8rVsjMVihvg88PSe5s=;
 b=FopnUpMXCiCWXzpQuHWfENIneC4darCcS6FEfff9MK0/Tf+Evw2vK8WI93/e77ufzd
 C0VFeZGLTPzo2NO7xsbcfwsRy2jkpHPoSX5dOvvwOI3FDxyK31/6f6iA/PDUHYL18cFn
 ml6zTSGiOl9HgPxytFd9cYbFFTab5YCQ23M3R12aj+wEf70x9iMRB5BI7bn6awLGlRwU
 FXqz2KSb/T7cmHWuEdbbUIlX9jFB5U5poq132uVyyU6+CWdjsulHx7XTPQA0RG4dDpY4
 hl+HeBS2dAFpQqqm5uLnlX6qdJ/GFDmHqDgFw/I4e4CXTxRG4nKfEmGs5t7PHpL5r8Vt
 GgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795629012; x=1796233812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5p6EFOjA87jcLwyx8NSrFxBVW8rVsjMVihvg88PSe5s=;
 b=Se+j/vD50R4ljnaJi9eQlo0WEl7skMOBrqHcurI/2P+Nn9RFI2dKxPebqnEmOi2WFe
 rbwc7xPWSZHaZrXl2WN8+xtveAjONlaJUqBqret3PUegfFxeOnoO8/6a/Tof301MYxNu
 f5HQdUGJRJ29yMr/pfmZPe8OQOVoVe1hZ3BT4evSmwvhCVr0jWqnFG1CBOWs/LuG7DHO
 xhgLcWdScQ18dVJrlcCUJgMmBWhWQ0oYUSCULSXlf7LaJxTBM2Ef2S5+Vx9PLqEhDj2a
 OikPg00L7jOjKDsQCMjpSBaG2WJ51kffycojjtjXxpdPuMxaYI7BXHYP01HVHvK24CSf
 AZpw==
X-Forwarded-Encrypted: i=1;
 AL+hErGMBF64EuY4lICnULTRxbbcE2LAMi4ljkm19sF3/PMEs5x3qkuWTiM7G+k1/mHfZ32pkDc/gHO/yQ==@nongnu.org
X-Gm-Message-State: APuU4Z+dzuytsUtd5Fk/ZkC0OEy9Z01XBL1VreDzXMf58COkYGXbp8rx
 aEnXL9Hyd8Tov+xoDQ+eCqF9dy4WUD4oKhw5kTWBpu/xGy9rC39ARfvr
X-Gm-Gg: AZFdTZdvZKEqF6QQnf3pIb+ZdVUgpfMkufgb8uU0y45HzayWwOs0IMZz/O7YRplmOtI
 KLC3COgPi7uaE7gxTirc5UeIcsAt38goXLD3WAXvQ/jLUudtvtHDnTTORWfb0+fdTTZaeem6iJE
 SJNgXPPpUgm7/Bt1jNucU1kDBf8LUgi+waI4kUiNWjkp2lYwznVdBXztxLiCM18RRDe6Xcht7PV
 TZJEX852pDx+m6as5zTduz1eC6IMTQh2hU07Fk1jyR5nSBhhoaRh7a2kSFOUFLKSkKjwW8Ns6xc
 trfu2weKGRROBrFglTvzpAhzidq/4Pe8kmoxL72hgcc0r544/e1i/VMhtH576jdGtoZKTXV7WWC
 1iHjsD/WNHA00qEiKD8RCp0A0xHGU7av2a2Nf6SQL6PhayloiCk8WcCZE5YnaITndqug+6hFTrN
 YyTsM0r1VABzFOefKquzwCZEQV/xMu5CeH7sC7DFB7vik29D8qNfH1skTacb/VjNbkr65plVnQs
 4tEanJdCSf7yTEr97x5yrfLR2Vr+jBsIJOCsv0PJIAm7NfrvRUPSZLhmHt9pUTn4+haX00StfyS
 pFx8qmD29owaOaTgEGbESYFNNEGwBYMKeLnU+WqeU1T2PdyJq59dyAQeOAotkZUHo9vFdCtp037
 rbmNSfA1BhJ2Xyn5v1meP1fvd
X-Received: by 2002:a05:600c:83ca:b0:4a1:9661:14b5 with SMTP id
 5b1f17b1804b1-4bb888176eamr378604125e9.29.1795629011682; 
 Wed, 25 Nov 2026 09:50:11 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.25.192])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb906cdcc1sm301652845e9.2.2026.11.25.09.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 09:50:11 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: Eric Auger <eauger@redhat.com>
Cc: Haseeb Ashraf <haseebashraf091@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Haseeb Ashraf <haseeb.ashraf@siemens.com>,
 Eric Auger <eric.auger@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Khushit Shah <khushit.shah@nutanix.com>
Subject: Re: [RFC PATCH v2 0/3] arm/kvm: select an nVHE-only EL2 with
 SYSREG_ID_AA64MMFR1_EL1_VH
Date: Wed, 25 Nov 2026 22:50:05 +0500
Message-ID: <20261125175005.805533-1-haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <63fcaf35-5d3f-42fb-868f-9fcd644bf494@redhat.com>
References: <63fcaf35-5d3f-42fb-868f-9fcd644bf494@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=haseebashraf091@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Eric,

Thanks for the feedback.

I agree that exposing VH as an exception is appropriate for now. KVM
does not expose VH through its writable ID-register interface; it is
selected by KVM_ARM_VCPU_HAS_EL2_E2H0 during vCPU initialization.
Keeping this explicit avoids prematurely adding a generic framework
mechanism for which no other field currently has a requirement.

On the second point, my wording was imprecise. KVM updates the
guest-visible ID registers automatically after vCPU initialization, and
the guest sees the derived ID_AA64MMFR4_EL1 value. I referred only to
QEMU's cached isar.idregs[] copy, where the framework currently deposits
the explicitly requested VH field but does not re-read fields derived
by KVM.

Thanks,
Haseeb

