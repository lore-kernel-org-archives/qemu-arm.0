Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp301836ejq;
        Thu, 4 May 2023 06:27:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Btdy4akepzlZrdwS5mdkNnluhbukLBFc60GsBGKayf4FkgRpNcnxVNH3HIgioWd0uizAR
X-Received: by 2002:ac8:7c56:0:b0:3f1:e57a:de9d with SMTP id o22-20020ac87c56000000b003f1e57ade9dmr6530395qtv.0.1683206869680;
        Thu, 04 May 2023 06:27:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683206869; cv=none;
        d=google.com; s=arc-20160816;
        b=UzLp0YLN5kBI7ifdPBb3cojvHepTWRTY8iqBnt4XxQk28zNTws3ycuP5ddYQacAv7y
         U410Psl0+aE9Kbk7Y3gWmKHtV0wzuzyrN+v1+xbnpetrCbxJQPsXVUiHfftf4MrGnoHI
         BslCY4NGr5PMZe1kMfEgc21ITwM/bmdcWq9KblYXdwd+HtnMbSuxZx+asTDpea8Nibqc
         nQ6ehbwT0OE3ZbTXTMQNCS26YwEbHXJdqnPVyh/MmWH9GDdY/idiUw4qN52tToz3WVHF
         Wp/oHyOk3qKw2y1WSUuQ/wkfaugXH24NX8X2TtjG8cU3YbHOGslqIa4w0m3OiM89b5Q+
         8exg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature
         :dkim-signature;
        bh=HcMII6ChGAGYjOLxXTYDfDqToJxPc9woYkrHQEvR0zQ=;
        b=CyJy8SZZCQCe8Siv5Tst5UQl5kCOmuWCkTpNpsGBH91vkDwWxOUpJBJnZZuZL1jYkK
         aaIVfhNry47XmMAue5iYnpNjRXBCF4IYB3SaP57RJawylSSneb045SwWo7wYJQ9Sc/zV
         gMVkP6Umiq710+6yWraxFB/wVSSofBjMqjiroCr3TzW89Ye/mqlfWy+bjnLdOnTTZghG
         1j2oFZmkEhUM4OnuaqlA2ou8g0JC8gzan0v+Z5XYRV/Woxia8vOigiyEmWVgJTwP8tHM
         eDdG5zrbxPi2R1eY/FZLZ+02LHRQ0sI0B5xBoWO6kAhEOY/99ps50RQPIpwhcoCQa7Bp
         44KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=V1+WaIfs;
       dkim=neutral (no key) header.i=@nongnu.org header.b=6IAGFArM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10-20020a05622a148a00b003e37c8a2909si20085141qtx.145.2023.05.04.06.27.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 May 2023 06:27:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=V1+WaIfs;
       dkim=neutral (no key) header.i=@nongnu.org header.b=6IAGFArM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puYze-0007Ve-R7; Thu, 04 May 2023 09:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1puYxf-0007Ku-Df; Thu, 04 May 2023 09:25:31 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1puYxd-0002xh-SJ; Thu, 04 May 2023 09:25:31 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F35DA1FD79;
 Thu,  4 May 2023 13:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683206727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HcMII6ChGAGYjOLxXTYDfDqToJxPc9woYkrHQEvR0zQ=;
 b=V1+WaIfsBqJ8Fbp0v9pXFkVptlG7GXiR4nl4FS1tUHMW0jPiGquQyLo3pMsmv+wYa8OpoT
 tGpuHlh5YMYgNghgKHluW2LSS2Wny7WvTRqTsuTq0cv8QWL7yoOwfMCng7KGrLYPHDZOd5
 DQ7tGkdx112VPd/I87ePmlQsyLBkbwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683206727;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HcMII6ChGAGYjOLxXTYDfDqToJxPc9woYkrHQEvR0zQ=;
 b=6IAGFArM045cOqKu6ZJywzIIvcCpmnv6dSwWQ2u+DTs0yAvN09A9s2SMk5nIhtrUOODDaA
 7lKT7V7j3U+pDRAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7454313444;
 Thu,  4 May 2023 13:25:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sNReD0eyU2QfXQAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 04 May 2023 13:25:27 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: Re: [PATCH 1/2] target/arm: Move translate-a32.h, arm_ldst.h,
 sve_ldst_internal.h to tcg/
In-Reply-To: <20230504110412.1892411-2-richard.henderson@linaro.org>
References: <20230504110412.1892411-1-richard.henderson@linaro.org>
 <20230504110412.1892411-2-richard.henderson@linaro.org>
Date: Thu, 04 May 2023 10:25:24 -0300
Message-ID: <87lei4jkjf.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
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
X-TUID: vU7FCwRpm4LN

Richard Henderson <richard.henderson@linaro.org> writes:

> These files got missed when populating tcg/.
> Because they are included with "", no change to the users required.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>
