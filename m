Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp5338601wrx;
        Tue, 26 Mar 2019 10:11:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyigVPl8YfHcSlKZOu1jE1HZycx9uiFqHXD5eU82p2ACk+oh6ZegdknFh1igtDfpROxVgRb
X-Received: by 2002:a5d:899a:: with SMTP id m26mr23604552iol.268.1553620263480;
        Tue, 26 Mar 2019 10:11:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553620263; cv=none;
        d=google.com; s=arc-20160816;
        b=h4l8cylI9eblX8/nG+WmTKYroTZq1ezx2MWD0gUR8mpGAyFoWpnnCDgt2uPd2+0T3U
         TbKn+wbhs+WIIV9T5sAoeUB2jRYCgEleTfDG80x7MAM9fpwjMLf+vYuqedtaE0gCa+o5
         ok6e6cllW5+rbCnTWGRMV9rvDUQAMGJ292HhPTloAe5SIUvw/Gy/DogehMKtpawOBXFj
         P/nRyE1w4Jxr3nK5SviYa8YlKywf4h+Lh17QCn4K7+hXFenvA00ecGW4GWrzMV29SKyE
         1PWBwz+dPcLAtkbCYkP4V5aX1faeNwc0Tl8ynd9S+q2SOsScdPIhJjGCZxSHPS0y/IBZ
         PKoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=OH/DPDy/ryaKERaCwPptjtccTcFZeTh3YZ2uOzFiKsw=;
        b=kV2Kj1/BFkDfJUDm76uuqZw1bUIf6x1013BqOor/aKXysOryRUSAxvfgWtXSshGQf8
         YHjUGVHoNQOJygAlQYjbpVULKpL60N+nBC4GDVgt/I59E8VWEcVJaNxNpMget2nUWOyk
         50GtSZc6JfWwexBfcsGWRrB++Sr7a7x+t9c74R2my71AC2ufQKNSfq2A4FAhywx0vBKB
         fGlxSEar6y213TDJwVVXHAiaDM2/eLlD9xakS79MyW3c/B3+YsIAoFrvQZBjfYbm2jfI
         TSlseMG8hNBFZ+Qp2BKr477lTTxi/SE9Eo+RrsOYfx+rfTCIA5EHOmcIEO1G86c5bPZ5
         +uvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t66si5985088itb.53.2019.03.26.10.11.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Mar 2019 10:11:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35364 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8pbK-00081K-NA
	for alex.bennee@linaro.org; Tue, 26 Mar 2019 13:11:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h8paz-0007w1-LR
	for qemu-arm@nongnu.org; Tue, 26 Mar 2019 13:10:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h8pay-0001LG-LY
	for qemu-arm@nongnu.org; Tue, 26 Mar 2019 13:10:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51760)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1h8pay-0001Kv-Be; Tue, 26 Mar 2019 13:10:40 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9DCED5946F;
	Tue, 26 Mar 2019 17:10:39 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-124-29.rdu2.redhat.com
	[10.10.124.29])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C31B75C223;
	Tue, 26 Mar 2019 17:10:37 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>
References: <20190325125142.11628-1-zhengxiang9@huawei.com>
	<CAFEAcA-O5+A0Q=14k2vrBg3KNM7MmqbcyhBoZZOe=AsyE-UDbw@mail.gmail.com>
	<19929558-9f2d-148a-4357-d48b46f8b62b@huawei.com>
	<87va06kvm6.fsf@dusky.pond.sub.org>
	<59f100b4-f6e9-973d-532b-58fb172a7009@redhat.com>
	<87imw5fv45.fsf@dusky.pond.sub.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <abe1d9cd-85bb-2ef8-630f-af28cae6378c@redhat.com>
Date: Tue, 26 Mar 2019 18:10:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <87imw5fv45.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 26 Mar 2019 17:10:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH] hw/arm/virt: use variable
 size of flash device to save memory
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Zheng Xiang <zhengxiang9@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, Heyi Guo <guoheyi@huawei.com>,
	wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ATTfXz3mjo3T

On 03/26/19 17:39, Markus Armbruster wrote:
> Laszlo Ersek <lersek@redhat.com> writes:

>> With the dynamic sizing in QEMU (which, IIRC, I had originally
>> introduced still in the 1MB times, due to the split between the
>> executable and varstore parts), both the 1MB->2MB switch, and the
>> 2MB->4MB switch in the firmware caused zero pain in QEMU. And right now,
>> 4MB looks like a "sweet spot", with some elbow room left.
> 
> Explicit configuration would've been exactly as painless.  Even with
> pflash sizes restricted to powers of two.

I wrote the patch that ended up as commit 637a5acb46b3 -- with your R-b
-- in 2013. I'm unsure if machine type properties existed back then, but
even if they did, do you think I knew about them? :)

You are right, of course; it's just that we can't tell the future.

>> Second, regarding physical RAM consumption: disable memory overcommit,
>> and set a large swap. The unused parts of the large pflash chips should
>> be swapped out at some point (after their initial population from disk),
>> and should never be swapped back in again.
> 
> Just providing swap should do the trick, shouldn't it?

Yes, it should.

(I just find any given swap setting more trustworthy if memory
overcommit is disabled -- for me, disabling memory overcommit comes
first. I trust "this swap should be large enough" much more if the
kernel enforces allocations and the OOM killer can't surprise me later.
I know we don't check g_malloc/g_new in QEMU, but I still prefer if
those crash QEMU over the OOM killer picking a victim.)

Thanks,
Laszlo
