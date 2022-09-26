Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp2227242ocs;
        Mon, 26 Sep 2022 07:52:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7v3xO1OAVnvBA8iMJoy0JlBYll4KvqVZEqLj+2Ikgb6WcMqV5oDWzDZ8Vrr75pSyttHBha
X-Received: by 2002:a05:6214:f24:b0:4ac:a9fd:8b42 with SMTP id iw4-20020a0562140f2400b004aca9fd8b42mr17500465qvb.22.1664203979591;
        Mon, 26 Sep 2022 07:52:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664203979; cv=none;
        d=google.com; s=arc-20160816;
        b=Q9/XrTuLYE4uilWcOjaYulPAiHsJM9VjErMJ3ZauwCO33JM4g9d85YMQs1HMZJLxsn
         RJMNFPDbLDwJqblvV+6LxUaRjdXMeLwyV+2rAq9KhKHtJhJIKM0od5osCADxFN071Omw
         UDh3j7MoUjPvYPA+/0Oifc7+EXJB/RszQDahEx89wnebgXhidf6iiwnmNqZq4F+rOgFN
         /3wm//aapytpA33H6DxcLD74bIm1ouvot+EAQMFqFnLpK4DdJX7Cyhua+1ByCRrajJi1
         unqWZ96al1EecKOXqGUv8jkMqi+q5dSe8cB2dNNHRMXc4q5TwadceSAKDIPv2VCxtKVX
         7HvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:in-reply-to:subject:cc:to:from:message-id:date
         :dkim-signature;
        bh=dkXObHnlpzcLSDLYoO2V25IlWOlVkX1acPpr/ZNipcg=;
        b=le/0WhkOkFv+j7UvAIcM6raoGK3fUAkx7zaYguvOI8qOM9nvdAcUrBb9OVVElbNXFi
         oLMSOuNYDCP0pmbrXZwug8MMvAizCUoScw7ja6+XoajdeGDYQ8X6IPvGNJ3oD+1Rf6YM
         qhSuPMbJxvz29dD7lbgxVGdH7RJTK1m4Wfy4TLNtW3mKcG2su3RzFoLBvkL785ullW/o
         ghPAu/S5anMp32NZUcXsXSpcpBn6+ATVLE46xX8B21ZCMxL5pUzfL61pC9JDBcKPGVbo
         b7Bxt/pSf6VJ552gEzll43AwlTIYvl7Hz0W9EJe6bQR+er24ralxHYP8v8TX9F5Xy8iI
         7+5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=GYGep8A4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x24-20020ac87018000000b0035bacccfe27si8461703qtm.195.2022.09.26.07.52.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Sep 2022 07:52:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=GYGep8A4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:48312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ocpTf-0003FL-59
	for alex.bennee@linaro.org; Mon, 26 Sep 2022 10:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1ocp4D-0006lK-IG; Mon, 26 Sep 2022 10:26:42 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:37900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1ocp45-0004Tj-UW; Mon, 26 Sep 2022 10:26:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E90C160DEB;
 Mon, 26 Sep 2022 14:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5914DC433D6;
 Mon, 26 Sep 2022 14:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664202390;
 bh=B9zfStorShcd/6Lj/Y7HIYoIbu5lEeFdrAyxIzwDCDk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GYGep8A4NMRw6VEpyuEuDEMrtrOJOwzTfmhCIfjIy/yGWQglozsDRuvHLZqt5DHju
 t4CNhqmX5zEyeUfoy+5xB5OInGWVOvHUa5ik7DrcFK+6zFjncDz49kxtimJgH4mFFu
 Qn2esz0jJqT8imIascorPy2kbmmz+qqD7pjlUh0q3e03rYs/WlLhpUpYGgkFs/+GEj
 52fzxddwl06Iy8nQItijAmppi/juuaYpt8dDmP22P2D8GCjyHzNzk+dJ0TU25XXT8p
 uxkVvUBhZ8wTNayGRNYJmcPvxekG6i1pqDbOpluk4fPZsvPI1b6dd7mlB3pNjIXlnL
 0jfk7xvGJwXZw==
Received: from sofa.misterjones.org ([185.219.108.64]
 helo=goblin-girl.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <maz@kernel.org>) id 1ocp40-00CiR7-Bg;
 Mon, 26 Sep 2022 15:26:28 +0100
Date: Mon, 26 Sep 2022 10:26:28 -0400
Message-ID: <861qry8b57.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Vitaly Chikunov <vt@altlinux.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] target/arm/kvm: Retry KVM_CREATE_VM call if it fails EINTR
In-Reply-To: <20220926133644.1345269-1-peter.maydell@linaro.org>
References: <20220926133644.1345269-1-peter.maydell@linaro.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, vt@altlinux.org, pbonzini@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=maz@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pYxi+CZ+JNsg

On Mon, 26 Sep 2022 09:36:44 -0400,
Peter Maydell <peter.maydell@linaro.org> wrote:
> 
> Occasionally the KVM_CREATE_VM ioctl can return EINTR, even though
> there is no pending signal to be taken. In commit 94ccff13382055
> we added a retry-on-EINTR loop to the KVM_CREATE_VM call in the
> generic KVM code. Adopt the same approach for the use of the
> ioctl in the Arm-specific KVM code (where we use it to create a
> scratch VM for probing for various things).
> 
> For more information, see the mailing list thread:
> https://lore.kernel.org/qemu-devel/8735e0s1zw.wl-maz@kernel.org/
> 
> Reported-by: Vitaly Chikunov <vt@altlinux.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Marc Zyngier <maz@kernel.org>

	M.

-- 
Without deviation from the norm, progress is not possible.
