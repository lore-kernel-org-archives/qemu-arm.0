Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4280066wru;
        Tue, 7 Aug 2018 07:38:40 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeGHM+mMp7Vf2cM5BIJz28MATKP4q8RMRNJE5wKJp/miDPvo85xg90vr/Uc24NtFts9fTQo
X-Received: by 2002:aed:3e47:: with SMTP id m7-v6mr19811077qtf.210.1533652720813;
        Tue, 07 Aug 2018 07:38:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533652720; cv=none;
        d=google.com; s=arc-20160816;
        b=Gj3RPWdPq3iAPiNcj5BEZ5AVUjnzY7qKccpTr8LQKM3rn+xS7rZ5gWmr5xbwOF8Itp
         gKe2MT7jpPIfTcCkcYUOgBsmkKtWIC8Y/boHp1df2w8xzPCBQA/u9A/4bLQT0SGAdMhM
         RW4rbDjVtBsvfzEcqOO6lGVHrWTKpsZsMfm70ZTM34G2trANSFcgtgdlIVbltkleIAiJ
         MYYq6NbAiZzE0UkaJywxphCXwEiQJ1ZObqQGGeBh4R6BYAoHtqVF8JLLWDy6DZMCm56d
         Q24FF2RC7V2SGDdJgkUKvsHQt1nujZ4VLivwdJlXnMy2va6ittmR7IYuYqNXKrRNNLxL
         SKwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:message-id:date:user-agent:references:in-reply-to:to
         :from:arc-authentication-results;
        bh=Ycw3R7mri7s2KVkV7Ko4/FkHlShnd0cq2lt4Q6AkZPM=;
        b=ymCDNlKBXpI2J1jD/aeopzKYa6eCEmuuHA0b9jOr6Qwt5icWx0WQqKrE1CZ5rT92EF
         9PPha9dAmO+mfGLrh/xAbDcKlQJgmFMvJo4cUYhd/y5OqMkcbo6ynWK9oH+C1rEBuWRa
         JH9ZHkxxbq8XkFLqKNWo/Gkz263kvLPICEI8xzHFkPJJRaB9sxRXjRTS2WF/NBgzenQK
         M9VOHVJq7HK1lZ1i7h7BpW7VnFuawtS/2thaHjLAs/WcsTDUyMcNynAbHZWbZgq+ZCg1
         Fk/lRflKHMXcZijnXqwoCtKDiFJZYDp68QdJSJPJtNcaI+KvH9ekt9KYfk8/Vlg2mRiX
         k1lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b6-v6si1522947qtc.19.2018.08.07.07.38.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 07:38:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39355 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fn38C-0006ux-Be
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 10:38:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1fn346-0003Uv-5n
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 10:34:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1fn343-00026O-BB
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 10:34:26 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58516 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1fn343-00025y-69; Tue, 07 Aug 2018 10:34:23 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9CAF340216E8;
	Tue,  7 Aug 2018 14:34:22 +0000 (UTC)
Received: from localhost (ovpn-116-36.ams2.redhat.com [10.36.116.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 413C72166BA0;
	Tue,  7 Aug 2018 14:34:22 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <20180806123445.1459-3-peter.maydell@linaro.org> (Peter Maydell's
	message of "Mon, 6 Aug 2018 13:34:42 +0100")
References: <20180806123445.1459-1-peter.maydell@linaro.org>
	<20180806123445.1459-3-peter.maydell@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Tue, 07 Aug 2018 16:34:18 +0200
Message-ID: <87a7py2ql1.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 07 Aug 2018 14:34:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 07 Aug 2018 14:34:22 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'quintela@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH for-3.0 v2 2/5] hw/intc/arm_gicv3_common:
 Combine duplicate .subsections in vmstate_gicv3_cpu
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Cc: patches@linaro.org, qemu-devel@nongnu.org,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HOwfCCR5339a

Peter Maydell <peter.maydell@linaro.org> wrote:
> Commit 6692aac411199064 accidentally introduced a second initialization
> of the .subsections field of vmstate_gicv3_cpu, instead of adding
> the new subsection to the existing list. The effect of this was
> probably that migration of GICv3 with virtualization enabled was
> broken (or alternatively that migration of ICC_SRE_EL1 was broken,
> depending on which of the two initializers the compiler used).
> Combine the two into a single list.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>
