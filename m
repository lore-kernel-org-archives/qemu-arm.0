Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp595390wrt;
        Wed, 17 Oct 2018 05:05:52 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61THUCkowS4G2LOb4uy2n4Gd9LIpXJeHB5n+GeWbiARvYJOJq1eZrrYl7hTZ8qqgde64HX5
X-Received: by 2002:a0c:eccd:: with SMTP id o13mr16885857qvq.42.1539777952664;
        Wed, 17 Oct 2018 05:05:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539777952; cv=none;
        d=google.com; s=arc-20160816;
        b=TpKXom9zyV/iFVtjiC3pSToUntCajpe1ZaHnl42epcQkMygMRtD5Vc9gETcdJcg8QD
         EcjdZd9+cqITxamcN04ZW0HPiHMG/n5ufihGx60wINyNt5/JsTHXj6Ket8qdhEVGyzxi
         wWCmnMpZ7YhgS/dzynWc7QvRk5ACrW4CgHQHtbe1nwdZTZXYp3H+0W/bOgsM9BXtbBt8
         iqjuk//EvHWdxhQsAjuDEOyO10aqs/zj1QpaUJr14Qz9dZhfnKyqXOW7g77c/FY95dBA
         HbKRXXJK/Ja3nJfVxacWIMrZdpWz12UWcwbxBL5uXNGUl24yGLzcrsSw/f436zpc38uw
         TVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:message-id:date:user-agent:references:in-reply-to:to
         :from;
        bh=RvBlsQmu7iRwsek7uQw0l+h8HM+Gv4KdNR0bbEkSoGE=;
        b=rxeEc+/onCzlQdnqXJplh2ktjhXCiJ+v47NnQ15EkH7GCpeXlfLAONfhlK2RyeizsT
         STjAKTzM5DHKM2HUn3WBkFXwxc9MnnSmJmuSEZHkAkTezIxHSy+ikIMCkTRRZown0vX1
         7w+byX14S8qDdGdI8G8d4Vp5aF73V9ngryhb/uhOPK6p2jNnLwCj+JEicin97/IyL+qp
         L5+P9HFjZgvfPekQE3tiYh+Zz0o7vE8mcpcxlrZcMPnMtdxKZYsfE0UQadWiocHAXc4J
         W9M1ssJtrD/jpEnA2ClcOjDUZwdHB3GGUZRd/DIzDRoPk4zXzOl6VqRxywx5GAYasie6
         LLOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b7-v6si38083qtt.31.2018.10.17.05.05.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Oct 2018 05:05:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36266 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCkaD-0002Tr-Aq
	for alex.bennee@linaro.org; Wed, 17 Oct 2018 08:05:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1gCka2-0002Rz-Ql
	for qemu-arm@nongnu.org; Wed, 17 Oct 2018 08:05:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1gCkZw-0002xS-2B
	for qemu-arm@nongnu.org; Wed, 17 Oct 2018 08:05:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47932)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1gCkZv-0002ho-6E; Wed, 17 Oct 2018 08:05:31 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 68CB81B285A;
	Wed, 17 Oct 2018 12:05:24 +0000 (UTC)
Received: from localhost (ovpn-116-210.ams2.redhat.com [10.36.116.210])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C7105C22C;
	Wed, 17 Oct 2018 12:05:20 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <3a964ae2-a5d0-5960-9e15-7ede929a8294@linaro.org> (Richard
	Henderson's message of "Mon, 15 Oct 2018 12:36:50 -0700")
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-4-aclindsa@gmail.com>
	<3a964ae2-a5d0-5960-9e15-7ede929a8294@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Wed, 17 Oct 2018 14:05:16 +0200
Message-ID: <8736t4aidf.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 17 Oct 2018 12:05:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v6 03/14] migration: Add post_save function
 to VMStateDescription
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Aaron Lindsay <aclindsa@gmail.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NEwoFypfXV85

Richard Henderson <richard.henderson@linaro.org> wrote:
> On 10/10/18 1:37 PM, Aaron Lindsay wrote:
>> In some cases it may be helpful to modify state before saving it for
>> migration, and then modify the state back after it has been saved. The
>> existing pre_save function provides half of this functionality. This
>> patch adds a post_save function to provide the second half.
>> 
>> Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
>> ---
>>  docs/devel/migration.rst    |  9 +++++++--
>>  include/migration/vmstate.h |  1 +
>>  migration/vmstate.c         | 10 +++++++++-
>>  3 files changed, 17 insertions(+), 3 deletions(-)
>
> Hmm, maybe.  I believe the common practice is for pre_save to copy state into a
> separate member on the side, so that conversion back isn't necessary.

Hi

Originally we have that function.  We removed it because we had not
remaining uses for it on tree.  I am not againt getting it if you need
it.

Once told that, I think you can add a return value as David saide.

And once there, it ia good thing that you document it if it is called
"before" or "after" the subsections_save.  There are arguments for doing
it either way, just document it.

Thanks, Juan.

