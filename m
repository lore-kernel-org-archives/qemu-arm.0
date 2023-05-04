Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp302182ejq;
        Thu, 4 May 2023 06:28:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6zubxCw2cZLUuUfvGUjjqdFnKg/roMxrWSjyvJwpH4SDw9xQ+yO5GJXgPvyIjJUQ07gBOO
X-Received: by 2002:a05:6214:769:b0:5f8:f168:e0e7 with SMTP id f9-20020a056214076900b005f8f168e0e7mr16613904qvz.29.1683206909524;
        Thu, 04 May 2023 06:28:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683206909; cv=none;
        d=google.com; s=arc-20160816;
        b=BrQKNU17TZht8iOIKXpTK4eeEcgL6LyQAu166P07Lm/5nQoNOuCo4NuvU5sJ/P31uR
         sNO4Ki1gjrzNF7t7u9wZMny/1z4ljknwhP6penf5NxMcpoewHTwK/s0NUF89nnDy2FIc
         Ng7Cswe+2F49T2RvWnM1P1bUO46AaJm9ako6HmCfA1i1WTf3AvBB+uTjexSM4qm3Slvs
         /tlwIFoZVD28ClcwCcWmUkQo7DnUcTn0Tq+q2Zyf720jTth+GBB/DjNnBWyL+5PECC06
         FmlVUov59Yj7kMPgCqZEkzynHjtYBfRkokda/IWzhp4292rJek+mmbL1tyZnW8bwo9sD
         C4gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature
         :dkim-signature;
        bh=qZrNvbff2dYgzK6kgpqSQXgNSPXbLmFT2ff5DIV1KMg=;
        b=ujKMyU4gwvSqELLDfI8vyj/2pG4DNOZpI1BrZhU/hyo4GjbSTRYLX3hDvsAycv6ApW
         GUb5G8vt3scckJyX/Qg7QzU3OFxurlzblEJ0nJKdyMbVLz5EVm5yUsURt7ucGh6usWC4
         f5+0CndXcF17dZH1GWa6EDwBGzbE9t8y4SUUGqPCjPcTPnzL98qb07GMXnfGHOMRB4Lj
         kFXCNoQ87ZiHFUiX/uN5Pjebj2nN+67HRJURWSW+AnKYSiWsIlLPZ8QH6z4HzNCpLrla
         WNfwbHaKz8vV9ys3cOMT+T2A0MqZ2OYPQmdjqiPwYUU0VwSLxW6a3D4oBtnhqK4N53CO
         ffUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=2FKmdg2V;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=YYlMPqsl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6-20020a0562140c4600b005ac03c18e10si19425243qvj.327.2023.05.04.06.28.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 May 2023 06:28:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=2FKmdg2V;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=YYlMPqsl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puZ0U-0007kE-OR; Thu, 04 May 2023 09:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1puYy9-0007Nv-FB; Thu, 04 May 2023 09:26:01 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1puYy4-00033O-Rh; Thu, 04 May 2023 09:26:01 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4042433947;
 Thu,  4 May 2023 13:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683206755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qZrNvbff2dYgzK6kgpqSQXgNSPXbLmFT2ff5DIV1KMg=;
 b=2FKmdg2Vjg88Io+J42m1G4zqe2WyYNvJS/WySgIA1jgD0FZIxRvGd0ws9Ri12KUslxsSzb
 TblPlcu3/ZMUeRq+qMRKJfcSh29OW+WHBEPAFinbqZnhq4FViu6CbWS3suPjsNRr1F0ejr
 Tz4djote7Q6i9NDAExfP6+alrNmKJyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683206755;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qZrNvbff2dYgzK6kgpqSQXgNSPXbLmFT2ff5DIV1KMg=;
 b=YYlMPqslQSzY1MJBa5eS7tiZPNLhDdiaNBLEoi/TmjP3sD5aXEzCJxzinT/0wvAMjlirdg
 Wm4wqe7Lhu3GSiCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B641E13444;
 Thu,  4 May 2023 13:25:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LA16H2KyU2RjXQAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 04 May 2023 13:25:54 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: Re: [PATCH 2/2] target/arm: Move helper-{a64,mve,sme,sve}.h to tcg/
In-Reply-To: <20230504110412.1892411-3-richard.henderson@linaro.org>
References: <20230504110412.1892411-1-richard.henderson@linaro.org>
 <20230504110412.1892411-3-richard.henderson@linaro.org>
Date: Thu, 04 May 2023 10:25:52 -0300
Message-ID: <87ild8jkin.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: dMOSyHqlDFjC

Richard Henderson <richard.henderson@linaro.org> writes:

> While we cannot move the main "helper.h" out of target/arm/,
> due to usage by generic code, we can move the sub-includes.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>
