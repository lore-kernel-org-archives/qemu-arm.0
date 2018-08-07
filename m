Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4292122wru;
        Tue, 7 Aug 2018 07:51:40 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdoBvZO/7Qo/CUnXENAO/pkYI+uTke+HWD3FScsX3PQKAfsJ1B3QBSGgrPf56YKJ51FrJo5
X-Received: by 2002:aed:3b6a:: with SMTP id q39-v6mr19056108qte.246.1533653500111;
        Tue, 07 Aug 2018 07:51:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533653500; cv=none;
        d=google.com; s=arc-20160816;
        b=tlV0ot28UX6HFe/U9j9PsFGvmtbb1tCpiiX2pj5onM8MChfDSYlHUEfukS3gzz/ANq
         FDvHWVgFj9uIqw+3vvZX3aErWT5z/0TNlQJbDb2rVRara02FzPvxFhFSA4Eel3gbluQR
         FNa9Oc067M8iFSRA1oT2gBPhPeG3YwTBwSOxtPaKai/uorJfgRt4ALOHlxAKeqX/EzTX
         9DUiUfTy/JWgsjruNr7/UPfx8Mu4DI5ODEz5fRcYBx2NmGXDA+4cgJyPamKGevJU3eke
         c4sDk8BwU5i5Y5ZioKaWNFsLakzyGrZfPIaZ/GSv2RRfYzKx1L8uvSj3XMnKJaW+ZrQT
         oytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:message-id:date:user-agent:references:in-reply-to:to
         :from:arc-authentication-results;
        bh=Lb8AZ6a9TnypeycKrBCw1GmuOv7O+PyqvYUgqqL8rgI=;
        b=PmrC4asHvFnfJncS0vf9oKuYrmUqgjvUwWx0GwH4OYe1jNy3g9e3/IBdsQhnL1iqeQ
         xdoPU+PdzeYPHzWyIGNbRp/JcmwKVU8keaal7XDPaT9qpTuFscuocdsnyFHqHO0rk1X5
         XLZrwS5tcozIIkNhHpZfXOZVmjHDvTm3aY4a9egvf48d4ENaWtTM0bG8XxKDUlaA5UVJ
         JQUL5Vxut2A5j+P90ZqBh431tk1nwqrh94whhS0M5BFqC4RpPqRTOEKVN7C9bbUHuo36
         kCVdxtSEcJPDvd5n2CSLlDVB72twrMZKmCjWJdfGleC1HZHU1FumEIZI1suShvBmZ5La
         Ywjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i8-v6si1312965qkm.41.2018.08.07.07.51.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 07:51:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39417 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fn3Kl-0006Do-LA
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 10:51:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1fn3K2-0005z0-2i
	for qemu-devel@nongnu.org; Tue, 07 Aug 2018 10:50:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1fn3K1-0002hC-BC
	for qemu-devel@nongnu.org; Tue, 07 Aug 2018 10:50:54 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59264 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1fn3Jv-0002e9-DM; Tue, 07 Aug 2018 10:50:47 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A172240216E4;
	Tue,  7 Aug 2018 14:50:46 +0000 (UTC)
Received: from localhost (ovpn-116-36.ams2.redhat.com [10.36.116.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D8D610CD893;
	Tue,  7 Aug 2018 14:50:46 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA8O-SL4Bg4ar3QLLFCPcF8A7W7mRu4D8bbXvJkFUsXTKQ@mail.gmail.com>
	(Peter Maydell's message of "Tue, 7 Aug 2018 15:45:09 +0100")
References: <20180806123445.1459-1-peter.maydell@linaro.org>
	<20180806123445.1459-4-peter.maydell@linaro.org>
	<87600m2qb2.fsf@trasno.org>
	<CAFEAcA8O-SL4Bg4ar3QLLFCPcF8A7W7mRu4D8bbXvJkFUsXTKQ@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Tue, 07 Aug 2018 16:50:42 +0200
Message-ID: <87sh3q1b99.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 07 Aug 2018 14:50:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 07 Aug 2018 14:50:46 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'quintela@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH for-3.0 v2 3/5] target/arm: Add dummy
 needed functions to M profile vmstate subsections
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Cc: "patches@linaro.org" <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TqrSjU6xHi5h

Peter Maydell <peter.maydell@linaro.org> wrote:
> On 7 August 2018 at 15:40, Juan Quintela <quintela@redhat.com> wrote:
>> But having 3 subsections with the same needed function ... we could have
>> a single subsection.
>
> I wanted to keep the change small here since we're very
> late in the release cycle, so I kept it to a change
> that restores the intent of the code, ie "always transfer
> the subsection".

ok with minimizing changes.  But I can't understand why that is going
that way.  Seeing this, I am making a patch that at registration time
check that we are not doing something stupid, like not having needed
function, bad names, whatever.

Thanks.
