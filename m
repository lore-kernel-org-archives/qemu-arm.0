Received: by 10.28.173.206 with SMTP id w197csp2507317wme;
        Mon, 15 Jan 2018 01:27:09 -0800 (PST)
X-Google-Smtp-Source: ACJfBovBdH+jfBEE+0g7LWOtA/kmlslSxNS+fTYWvVQSafE3PVlunrRRuPAqrTHS3q2txoRx1hjk
X-Received: by 10.13.203.138 with SMTP id n132mr22073669ywd.39.1516008429005;
        Mon, 15 Jan 2018 01:27:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516008429; cv=none;
        d=google.com; s=arc-20160816;
        b=zAFJQGcJ54/y7O9xcKHnAKgIplXlXHuRDZQHs5X9Tm+8L3pD3dcgfJB037PGxZxQDg
         e9J1MFNyJOI2J+UKhp+2SlPpN/5n9TGdy0ahhlcKGWEoH5FIJYAl7BX0PNDyLWPazGEf
         oZpbWcqwQ1kjSGN7kXI353IO6Nt4kYKr5z7IYYLDObEGzs6hFMWT3o//3kBfzQ+yKcu0
         U981gVoBo4YtvN4EkIz31dCXyDlWZfyxdqKKeby8wTy2kzXYHtAHbppcN0R183h/7zNO
         +6twv+55tofBRIDgjj0qON/jSYbMA7Z7yuu0dlPGTAAL9YhPPmID/AEedmwAnmkENQHS
         NGbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to
         :arc-authentication-results;
        bh=ZrnY/2FkWxrCzVEKXBGDt7YLn9eSGKophWL/0wRcwq4=;
        b=hQGtW/JLNvAvVPMcD08n+pNNGDQNhpgZPhR85uEtmfmFWWERFc/10V9YqTu/syWPBm
         cYGX0zpey6CkLjO5DIY9XdjUzHzzEwc7WXyC5NfaxyRjwyRpeoOtmsT+mwFkUy5pPQEJ
         tLDBqhM7TZpVEN8YG6edeBB0C/5xoS/gOOo/uoIJQW3pObalnkl1UUOpuYfW/FenzNBC
         oJdMsRaprPHb9LGdyMKdpec4R0saFvjG4gCFADWlVx9d83HnTuR1qeiqNIuZHGV8C+hP
         XQd1bGLpS7iW27BOuETZakOptGW5kNKBDAHdErHb/lMr+eKSitgFTpxsLNScLMM9UyW8
         52sw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t84si5858627ywf.135.2018.01.15.01.27.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 01:27:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50544 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb12q-0005G4-GY
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 04:27:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1eb12k-0005Fq-3U
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 04:27:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1eb12f-0001AV-5q
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 04:27:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54208)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1eb12e-00019d-Tf; Mon, 15 Jan 2018 04:26:57 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34343C04AC45;
	Mon, 15 Jan 2018 09:26:54 +0000 (UTC)
Received: from [10.36.117.212] (ovpn-117-212.ams2.redhat.com [10.36.117.212])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5209A5D971;
	Mon, 15 Jan 2018 09:26:49 +0000 (UTC)
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20180113111428.7066-1-laurent@vivier.eu>
	<20180113111428.7066-2-laurent@vivier.eu>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <933500bf-2833-9585-561b-40c43c3ab9e8@redhat.com>
Date: Mon, 15 Jan 2018 10:26:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20180113111428.7066-2-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 15 Jan 2018 09:26:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [qemu-s390x] [PATCH v3 1/7] accel/tcg: add size
 paremeter in tlb_fill()
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
	Aurelien Jarno <aurelien@aurel32.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Anthony Green <green@moxielogic.com>,
	Chris Wulff <crwulff@gmail.com>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Michael Walle <michael@walle.cc>,
	Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yWaMViyPV13c

On 13.01.2018 12:14, Laurent Vivier wrote:
> The MC68040 MMU provides the size of the access that
> triggers the page fault.
> 
> This size is set in the Special Status Word which
> is written in the stack frame of the access fault
> exception.
> 
> So we need the size in m68k_cpu_unassigned_access() and
> m68k_cpu_handle_mmu_fault().
> 
> To be able to do that, this patch modifies the prototype of
> handle_mmu_fault handler, tlb_fill() and probe_write().
> do_unassigned_access() already includes a size parameter.
> 
> This patch also updates handle_mmu_fault handlers and
> tlb_fill() of all targets (only parameter, no code change).
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 

Thanks,

David / dhildenb
