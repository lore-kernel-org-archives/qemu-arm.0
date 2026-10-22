Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E03606A31B
	for <qemu-arm@archiver.kernel.org>; Thu, 22 Oct 2026 10:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BPS1WeNt
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJq2T-00013z-5o; Thu, 22 Oct 2026 06:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xJq2R-00012m-7d
 for qemu-arm@nongnu.org; Thu, 22 Oct 2026 06:28:47 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xJq2P-0006tT-P8
 for qemu-arm@nongnu.org; Thu, 22 Oct 2026 06:28:46 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-8acda240937so14449827b3.3
 for <qemu-arm@nongnu.org>; Thu, 22 Oct 2026 03:28:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792664925; cv=none;
 d=google.com; s=arc-20260327;
 b=iEgHsRcw7WxM9Es7mg/a3mfN0j8pDoQaN5bHMm9Ypge2n7JheRe7U+ZDL469qqJk15
 vwMt9JrW+3zn34Z0FNOolEnsjQy7C6UjUU9ogWaxiAq5Ig2r8lNAAWu9+gPllSaJstCg
 XvvBRpN0YfQamEFxuNKZP04zFb/Y4TINTOYJQfqqYDK/vBJpo1hwLlxZb8BEr7D+AXU9
 JKbcO1IsOPKiE3Y+58BNzfowGxVIZCgYhzeO06zMFT7zG4mdJS64RGIuDoZIu+MjD85h
 un3OVf1mM5ouCHcmKaDzev41p1LO/EQoSNOPWhRriJJf9KI6hoO8Jsk4Nm68NlCf6hbI
 5qGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=R9+slaVplhS0h+TANs82YWQX1if6DaqQLvnNGQd68DU=;
 fh=0wnIPkcP9rTg5KDWeLSv9HsBcYsj0uum9gItSJjllx4=;
 b=E3PYvZFa9yN3jZxOw44oendbi+nqlFhaZ2nx/vWXCH9r3V9I7Og2y/qWlICyvFdL8r
 gB1NYpOPGas9bYxLuJyP9wU6OIzjF4ZpZpmrEYJ77/1AP0HwggAZNow6FSlaWWeeKY05
 DKCAWAQVAXjj8AgqykN3Cb7zk8ojiWes1olMVAKp7MrYv5zr3qAB/uKorQOAUrnI773x
 vEC1bloj1tfZdfIXUam8X5VINQDwMkXBqg/JRPqvMBulb5fRwsM2WQazFk9CrCXBl1DE
 5QaQGpjEBA0T6He6gzhWYTONe4yReWGEYayJ3X6Gp+SPkffmypvEpDt5V9o0VythbzWe
 FaTA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792664925; x=1793269725; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=R9+slaVplhS0h+TANs82YWQX1if6DaqQLvnNGQd68DU=;
 b=BPS1WeNtm9njWXVZfNkgrkoaYAEiWRdlGoX8oS9qUUXw252p+oe2HK6CBXyM7c540T
 LJ7YBkQW3zVndzXikkiZoyMVADRNWf1NIa1PoALxBKf7ttu8qldAnryeMxsf97lU43/M
 Zxml7Bx1lauu4Q7Ilcqu+KQsM0N+RhmLAWpYt1us/3FKc8sKA537QZHFlRBw2reqppbD
 8nWNRewUOSJoaydqdf5ulz4EKG5PdCB7RRVlY1/FlNF5EyuXj3SEOMD97kiUHw/sodXb
 wefXVAjN3ZCUFx2tSX/CeLP9SqPbJerWHwnF+eAmzHK3rtjp5+w4/AvuH7fD+FR4Jc4U
 40Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792664925; x=1793269725;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=R9+slaVplhS0h+TANs82YWQX1if6DaqQLvnNGQd68DU=;
 b=0SY7ocZn2EOQlEzccPC4iMpbPgzfqCJOf8kubA4QLUrXuI4W6RsW320ORD0JohJC9Z
 qEIayCQlv5yxtJOiw3CwzpL0vEpaffJn2FcvZWfz1AOIh8WsEvfd8TYIWpchNa7EfvZU
 HLdYKL2QUh1fJozo23/kOVTC+zx+L0jL3ldY+AnR2Idzp+j1jR8whijBMFIAl9bHC+6W
 o0OdZO9dkATCKRkAfDkpHGwW2OiTMnSOBLTeKX8PlReFmiW0NoNlIfxEiPQgAzWg1k3l
 6L2pJnxea8b8J9lapbqrvk7+aD5TomfgBcTSHKCg4vS/NM1WvhU5awuoPj1RpPo39JRO
 48QQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw8JrMeUda2hEf7QT5/RZhNk1LKwEeOUQN/2OvrXaU132WqsIYMTeGxJz/kiEP9ROQ2we65zEgHcQ==@nongnu.org
X-Gm-Message-State: AFq9FYL39SMCnDve2750cSp01v3czfNQ/LK5oJBIsWb9KMUXrMF0oH0+
 i7m6UhfnV28wgT3x4MnBc6tJEOrsHZdfcX7p1cTvLpRrrdCDtF9LAZ6YS+HJ/kT2/DWmRAIJSM9
 EzdDGj32QwVxngCSHdLkJT/WT9HDYsyq+MBxGjer9bQ==
X-Gm-Gg: AYBFou3XlnVwwkNy/iL4sAJjgXfIFljcV9WO3sjcTScvjuuut8OlB+RjJCYAGVPJ/Tj
 72TZW7oEm6MscGfFR0P8xoEkHUKW15WvJ7pG4q+Haw7lhODoQ039zglXYzTp4TK9dFEGF3b/65X
 9/9EIy6ddYg9OV60tFJ5Co7pYulH9lfQNv33nzMB7AqDUHi5AzMypLE31vXFi92VgJOupr7rHn1
 SltLXNmgICttJGez92vTtRz3Q1DY7PMLE25iLNX/CwoSGX6QTBZ9K/8JjOr79cuIolPuojvCtBc
 KfJWezgxB7S7DCEm/36fdiEg0NcSujNCDGUwci+0gqtoT1IsE8ILQjV8nodu5umUdNnaJUIa713
 AZvxW7YWjeZgR1ZpSbaZk8m3TSRaspwwDvFCDm33g534ppo7dPw5HEfh28iV2ycaMpwHuWC4kfX
 ifCsQiddd59gVgKJW+YWHu
X-Received: by 2002:a05:690c:e6:b0:8ae:85db:8e48 with SMTP id
 00721157ae682-8b134109c2bmr25286017b3.68.1792664924530; Thu, 22 Oct 2026
 03:28:44 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261010133725.642498-1-eric.auger@redhat.com>
 <20261010133725.642498-3-eric.auger@redhat.com>
In-Reply-To: <20261010133725.642498-3-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Oct 2026 11:28:33 +0100
X-Gm-Features: AclHuK93dWwl-q9PlNiq8ZHRWxeuR0zJWNXIhDag3YFIxNwVwRpCtcfZs_60VFo
Message-ID: <CAFEAcA_cNP-Gb2_r2xFW0qUUBrkygNpN2kxhz2curXfXXeWtww@mail.gmail.com>
Subject: Re: [PATCH v10 02/26] target/arm: Move MIDR into isar.idregs[] storage
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 kvmarm@lists.linux.dev, shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 yangjinqian1@huawei.com, cohuck@redhat.com, richard.henderson@linaro.org, 
 sebott@redhat.com, skolothumtho@nvidia.com, philmd@oss.qualcomm.com, 
 maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com, 
 armbru@redhat.com, berrange@redhat.com, abologna@redhat.com, 
 jdenemar@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 10 Oct 2026 at 14:37, Eric Auger <eric.auger@redhat.com> wrote:
>
> Move MIDR into the isar.idregs[] array as other ID registers.
> This will allow to overwrite it as others.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

