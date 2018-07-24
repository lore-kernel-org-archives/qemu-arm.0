Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp6963479wru;
        Tue, 24 Jul 2018 08:45:36 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe5Z659Nb+tRShl2nYtf9TCg/XfkYK9N2kCNWvxjeijOim4NPwGd1eXbYX2HHKUTdPXsCHz
X-Received: by 2002:ac8:166c:: with SMTP id x41-v6mr16675384qtk.245.1532447135958;
        Tue, 24 Jul 2018 08:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532447135; cv=none;
        d=google.com; s=arc-20160816;
        b=Th7Q5Hq5kOhGiXV4ziyx+VycW6wvcDyffP0k83SFuszxXejS/+0P0WuK9EMxntSk4s
         HK9LcAkSMbgJermCRnvBPzcTnJ8XKeMOF6E3YMm2YesivNojMm/y97h5CcVBwzmznCTD
         0zrVagVu9VSogTIhkbuFDAxJUcuj/yUCsnuPK7htpzg76eAKNsQwWNmFURGBjqRcWmt2
         TWYy+3B7xUCldQ/a0wNWqHY7nEAeAQi0NI7mtX8ncK9c+2VNKsc+RY4mfFd4YDwkNXyo
         0UPRULb7PzIJIbgfdoTYEnZf1ejGgatYhROmKInZrLvIoiGg/C8C4dMqpxpFWgUOVNg4
         ps+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=rCSlVCe1RRbZbZNwr0IQl294R8rxCsCpHIgAdddOEc8=;
        b=cloM53o8B9WSWA3GKL+NTruCc7VS+8r7YJ4+ZpwO+qMNLkbeTg1fmH+BD1r3gsjJOx
         PInNdw26V1l1GLAoA+cBHhOD8MoItyHqfWjoZLvDyG4zuC0m6TYLW2Svn8W6uY2DXpPJ
         Qb9WeYmJNkVraPZLNiCGm1vzpZ/CWvd0yY2TG61dvHuTf6QihV6HlHmt7KtlpQ9NwbLt
         a6XEKpcAX+h9GO6MVfrd0j1JyTz4d5S9scsoPkJkUjUvAs6Ip1W7TnQ8NtZshyObbGv6
         CXkjFJXN430i3QkBHp3pp0yG9Os/gHRilvTs/qF8/EWl9DW4LAPi5AtyjANGp0U98Cyg
         jilA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s26-v6si2761608qtk.191.2018.07.24.08.45.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jul 2018 08:45:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41199 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhzVH-00055c-2C
	for alex.bennee@linaro.org; Tue, 24 Jul 2018 11:45:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fhzV5-00055J-2a
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 11:45:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fhzV2-0000dE-0C
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 11:45:23 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59180 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fhzV1-0000ad-Pm; Tue, 24 Jul 2018 11:45:19 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F0F27DAC2;
	Tue, 24 Jul 2018 15:45:18 +0000 (UTC)
Received: from [10.33.200.180] (dhcp-200-180.str.redhat.com [10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6CB22156897;
	Tue, 24 Jul 2018 15:45:17 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180724153616.32352-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <a69b9ba5-1973-0d37-0cb9-0de4e4f21a91@redhat.com>
Date: Tue, 24 Jul 2018 17:45:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180724153616.32352-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 24 Jul 2018 15:45:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 24 Jul 2018 15:45:18 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.0] hw/misc/tz-mpc: Zero
 the LUT on initialization, not just reset
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5jrMxj4Fwd/k

On 24.07.2018 17:36, Peter Maydell wrote:
> In the tz-mpc device we allocate a data block for the LUT,
> which we then clear to zero in the device's reset method.
> This is conceptually fine, but unfortunately results in a
> valgrind complaint about use of uninitialized data on startup:
> 
> ==30906== Conditional jump or move depends on uninitialised value(s)
> ==30906==    at 0x503609: tz_mpc_translate (tz-mpc.c:439)
> ==30906==    by 0x3F3D90: address_space_translate_iommu (exec.c:511)
> ==30906==    by 0x3F3FF8: flatview_do_translate (exec.c:584)
> ==30906==    by 0x3F4292: flatview_translate (exec.c:644)
> ==30906==    by 0x3F2120: address_space_translate (memory.h:1962)
> ==30906==    by 0x3FB753: address_space_ldl_internal (memory_ldst.inc.c:36)
> ==30906==    by 0x3FB8A6: address_space_ldl (memory_ldst.inc.c:80)
> ==30906==    by 0x619037: ldl_phys (memory_ldst_phys.inc.h:25)
> ==30906==    by 0x61985D: arm_cpu_reset (cpu.c:255)
> ==30906==    by 0x98791B: cpu_reset (cpu.c:249)
> ==30906==    by 0x57FFDB: armv7m_reset (armv7m.c:265)
> ==30906==    by 0x7B1775: qemu_devices_reset (reset.c:69)
> 
> This is because of a reset ordering problem -- the TZ MPC
> resets after the CPU, but an M-profile CPU's reset function
> includes memory loads to get the initial PC and SP, which
> then go through an MPC that hasn't yet been reset.
> 
> The simplest fix for this is to zero the LUT when we
> initialize the data, which will result in the MPC's
> translate function giving the right answers for these
> early memory accesses.

Thanks, that fixes the issue, indeed:

Tested-by: Thomas Huth <thuth@redhat.com>
