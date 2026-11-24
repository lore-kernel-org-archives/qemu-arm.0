Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E65606A31E
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Nov 2026 06:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MV/MqDEx
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVjum-0005mU-65; Tue, 24 Nov 2026 01:22:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kmehltretter@gmail.com>)
 id 1xVjuj-0005lZ-Jn
 for qemu-arm@nongnu.org; Tue, 24 Nov 2026 01:22:01 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kmehltretter@gmail.com>)
 id 1xVjui-00042P-5U
 for qemu-arm@nongnu.org; Tue, 24 Nov 2026 01:22:01 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4ac95761c85so31384545e9.2
 for <qemu-arm@nongnu.org>; Mon, 23 Nov 2026 22:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795501317; x=1796106117; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pFZlD6TbAhtook5SW4q2fLh3I2rYl7pKA0DM+SwA75c=;
 b=MV/MqDExB7JeaX7bgoEB2Qvhb4seSlNxxnP2w5iVrhZtty/11o0LwMN12181U7gOxn
 JoshQjZq4xrO6C8axf9fZcZGFZC/JzgdDTsMMQHyzxis2b7nw7U/aR4SD8jPvdfqzcg5
 HSPB2sSUFCaMCeOlGn7cBxnxQBHJ58nZpPuDglcPrMJRDDVWszozL70I4caYN5xJUHmB
 VGmfbbNH/q8GOGriTRo5X5LcHn3U4mhLxlkCnjF1ULaVCgxKT4fbeNIk9AXC5bJm9XDU
 WuHHFNjvuPjftsIzuCirLDrExxBAKyFcpUekSuBEZ4jTudkF97d1JLAvMdgU5ovwUpwd
 L36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795501317; x=1796106117;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pFZlD6TbAhtook5SW4q2fLh3I2rYl7pKA0DM+SwA75c=;
 b=Zw3ZGkCYAcf018wGO3DRcjugomF62Zn2DGOtw8SIUbLJEESyieOuaToBVxppfgdsLr
 ZpTlmq5OzTAlXkt0VTTWNbX+welb5mpe+Nap4YjFZXD1s8WOHDX/75XJBwlsdKG26kDx
 qrcM/PBF0bRZFrOJq9hbOSHuYdP0oTOcBEj6lTI0hr08vsE/qs84CVeaBXiU7GG7bSwr
 vH9mZXfECVRPfAd8OxZ0ZiWwCqNmiMmswT9Ag2ziWR2EM2PycZQBof4g07MNTLEruKDp
 Y9rqppJZN3unnw+FOeHQUSAsKWiLqzBL/pSDwBr/16A2GEii4KlkruiJtPDH5v/NvqMn
 6enA==
X-Forwarded-Encrypted: i=1;
 AL+hErE/1CAzQoJ5iwmVtdEXyFBJnvKwpkEuGZjLzwsEZWgZxdYIbDvZQP5ZN/wRZGH/nYVRxbn40pmiPw==@nongnu.org
X-Gm-Message-State: APuU4Z8HaZwKgJCd8ISqsaF3lKqMNrb0pw2mrpKIJQ6MgV6WCFZN0jk+
 RppDksEfbFZHUAgoWpegbvEjvfOqFgAX26AcvUrTnnRbkHTwkhAGf8Zt
X-Gm-Gg: AZFdTZeBifipnq/fWcNexfIzND36VgrF+59QeMSYzMAcIsHEQj2E2/YdoRQzxBaQXvp
 zPjq7g+rZEo5b+QwDT5sIf6lLJiKz5WgR1P0+b1wt6jMssqDKl4T2pkVTI+3Di1MAEttmRa9tjo
 sXnmI2lfhgE+CpCkz6R5niJr9EuBX0YbgNJzxF552xCYkdrjp05GqozOpQec4BdK/7dff5BMXsQ
 56kJwa1m/FKx68kzrOHkIojBSVFw9gcXOJvs87WbjZTn+UGvgg/c6pOHzfx8eDPOb6f8eYombgq
 /9aCu06hM6XVOZUAvyGzTAAr69olzdU0p3r/luCUxkcomfp4l/GM7pN2wLvBdRHFxBcoq0bAP+y
 H9isJN27P2tNlDsE04wobmys1/6P7+pM89eqj8CiWNNHSM7+TNCc7HkA0Rxk3PLNqMa2WxAjJLF
 WrsHxtvvx0lf5PPZ3rdpiVmc7Llc6YdPHLTiPPlRfgwZZMgLxVGH2imu6GeLM21Gk9ZJOfRFlr7
 9PDANal83R6QpkQtpwVIJyUw4IpHKCFvC3vCCyvpnnC9UKm66B7GMQNN1gQpFi0Xoq1YSYhFp/i
 LmbcGNlVyFjAW9pmwVK04p14N3kiIFDaf+k21+0UqS0sws50GgnVCvUS+6RQcimrInVfovmzqI6
 1IHsbMxWCYPW16xaiWGRF4gIqeLOdsPuQnAk0cc+5HNsFnck9libadUGP6rC0GTwtSVEIqIXgO9
 HVmQ==
X-Received: by 2002:a05:600c:4fc1:b0:4bb:53e4:a7cc with SMTP id
 5b1f17b1804b1-4bb88820741mr306002655e9.30.1795501316846; 
 Mon, 23 Nov 2026 22:21:56 -0800 (PST)
Received: from MacBook-Pro-von-Karl.localdomain
 (dynamic-077-002-108-156.77.2.pool.telefonica.de. [77.2.108.156])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884b8429sm642583715e9.14.2026.11.23.22.21.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 23 Nov 2026 22:21:56 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
Subject: Re: [PATCH for-11.2] target/arm: Handle "PMU disabled" in migration
 validate functions
Date: Tue, 24 Nov 2026 07:21:50 +0100
Message-Id: <20261124062150.75285-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261119165546.3050013-1-peter.maydell@linaro.org>
References: <20261119165546.3050013-1-peter.maydell@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=kmehltretter@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 19 Nov 2026 at 16:55, Peter Maydell <peter.maydell@linaro.org> wrote:
> @@ -693,14 +694,16 @@ static bool s_rnr_vmstate_validate(void *opaque, int version_id)
>  {
>      ARMCPU *cpu = opaque;
>
> -    return cpu->env.pmsav7.rnr[M_REG_S] < cpu->pmsav7_dregion;
> +    return cpu->env.pmsav7.rnr[M_REG_S] < cpu->pmsav7_dregion ||
> +        (cpu->pmsav7_dregion == 0 && cpu->env.pmsav7.rnr[M_REG_NS] == 0);
>  }

the second clause checks rnr[M_REG_NS] == 0. Should this be M_REG_S too ?

Thanks,
Karl

