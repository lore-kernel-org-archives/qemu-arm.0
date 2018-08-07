Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4276002wru;
        Tue, 7 Aug 2018 07:34:35 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdv1hhFtxQc3umoo2TX86lr1eqzJEKrfTDteTKUKZZX7s3qakDlZMKvIjTBu0vYNYyEH9XD
X-Received: by 2002:a37:4951:: with SMTP id w78-v6mr17622026qka.2.1533652475305;
        Tue, 07 Aug 2018 07:34:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533652475; cv=none;
        d=google.com; s=arc-20160816;
        b=PxOG1hGdK3eH2o9fdBCH0DCNxqmVu/oyaMgbqESgNsp54idvYEofSaUxf70N349NkQ
         pJ3ejQeYW2lYbHYf+OgRl6zRw0gS73BZgoY23ODPczWrbw+z8zHbIrTiEm6ZjlAxm8la
         qxR0Iwq9AqwZDYlRmJQBTKLwIHjcWmb8bmg4HE2zcHE8nBkdt41BjQqUvsxMbOlEuuqd
         GN0DYw7e5xS26Ae6JTkQt323lb4pJg+cWjxMbFiFTRamU/JwAjgz8aMn5jiajhHXdqWP
         P32ky4gSTYxROa1ADNilYlPAcj1KzUF7fAQQDFlI9I8cO9vJU89zjF5lLgplaD/4yPIF
         KmnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:message-id:date:user-agent:references:in-reply-to:to
         :from:arc-authentication-results;
        bh=DX48aHfbvrUItcFVO1r5pkXPdnHKK0yD8TnLDgqYY9c=;
        b=qb8iTaAeiQoeqbC9XI8Pez6SMkaJYQrZmaJHnLTKjg/fT1oY0q4KmOTLMHgybSDTiw
         jQbZrD7Y2z5vXB3YBD0ohwCGGDkeGqveOyZroTUlFpaZKgorR+fmgq09w0OHaeAFZYn1
         eHFayHxqz36roJP8NRDMnJLdC5iEvd3K2LtjdZZGU/PDVVafNAolE+gFdpsVXhl/Xsc6
         BYF46gfCrr7ZlzDHyD7UhMPYhoyCqpgsYg6ml6KxA/cuqB4OgUr2C04Em2m9+faeqoay
         iVHI8VnnHZcQlkbF/o1UGeyB6+RKH8dCh8cCv2aGzG+LbXi7mbMDi5he2cvlW5IKGhtQ
         EV/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g9-v6si1412577qke.66.2018.08.07.07.34.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 07:34:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39331 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fn34E-0003OH-OT
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 10:34:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1fn33t-0003Mg-8M
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 10:34:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1fn33q-0001pe-4p
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 10:34:13 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44478 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1fn33p-0001ok-VR; Tue, 07 Aug 2018 10:34:10 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 71A7740241E0;
	Tue,  7 Aug 2018 14:34:09 +0000 (UTC)
Received: from localhost (ovpn-116-36.ams2.redhat.com [10.36.116.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 14F3110CD890;
	Tue,  7 Aug 2018 14:34:08 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <20180806123445.1459-2-peter.maydell@linaro.org> (Peter Maydell's
	message of "Mon, 6 Aug 2018 13:34:41 +0100")
References: <20180806123445.1459-1-peter.maydell@linaro.org>
	<20180806123445.1459-2-peter.maydell@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Tue, 07 Aug 2018 16:34:05 +0200
Message-ID: <87effa2qle.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Tue, 07 Aug 2018 14:34:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Tue, 07 Aug 2018 14:34:09 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'quintela@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH for-3.0 v2 1/5] hw/intc/arm_gicv3_common:
 Give no-migration-shift-bug subsection a needed function
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
X-TUID: cUhl+n8aGV7J

Peter Maydell <peter.maydell@linaro.org> wrote:
> Currently the migration code incorrectly treats a subsection with
> no .needed function pointer as if it was the subsection list
> terminator -- it is ignored and so is everything after it.
> Work around this by giving vmstate_gicv3_gicd_no_migration_shift_bug
> a 'needed' function that always returns true.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>
