Received: by 10.223.197.9 with SMTP id q9csp844908wrf;
        Thu, 5 Oct 2017 11:40:21 -0700 (PDT)
X-Received: by 10.55.4.136 with SMTP id 130mr26266647qke.226.1507228821320;
        Thu, 05 Oct 2017 11:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507228821; cv=none;
        d=google.com; s=arc-20160816;
        b=z7ecKJcGSd2BuGxJY1YPSAdPQoqEgb+QrbR57XCKHewZvbiykmLBIVMynpfe4OSvo4
         HcBal3k1yAbheLGilfK57tPKxX+b6HMDDSW7XUYjw/+1Uja6Y0M6P9NC7WT/WI2653Vj
         WVpejscBNesUmjO2GPzog9fpDVvZMHVvhwk+/FFfZNpq+5fNPaPLrcg5l5s5qE5EKCkf
         J/CaqeMIulbJPrcTaqgdFAgC6KrUiQLaaHv7JDY3WCJjS9eF+hikNQiZDbqTR8xlBr3X
         r6ixGiFQQ0nC+/dZ/sF+hl/Br2yeK50V0g5ixgSK1DKXQ3pO/b/FPlsx3T4q1d25y2IG
         1wIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=NFhX8dyP6P1JiD1gnlTcAV2BLdiD+wxRyQ0FG0dBfzM=;
        b=iOaiJKM5hQaJ40rpwkdgY9FG7RW+vRgMf/Jl6I51qWRbJ1bhFohnoH3XqYf3gwWIyJ
         fwT4ewxt1nbptlgcmn+2pUGIkMArH3Do0+zq5DBRaLEmKhVliwE8GDLqWamgfAKhqIB+
         JOLay4cAPjxaTZXSTrWhEmjwPYIZL5HCxxuaVaxdPNRZv3WZMovDOL3cBK5Wauqm9iqT
         WW4p1hfxsKn2HLmh63s3513YFxE7REKbGN1rKwiFZBGMKdqDlc8d1rO32CRlK71voCtb
         vmIW7sQsrT1irUVyxJ/KCpbY40vt7zieLiDAIfPsdUx8UWQ6v2pdNwU7P53ZGRugx9Dv
         dWNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Om4mpiJE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a18si6980502qtg.380.2017.10.05.11.40.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 11:40:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Om4mpiJE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41501 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0B4G-0004bG-Pv
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 14:40:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e0B3f-0004DN-LO
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:39:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e0B3Z-00013P-Po
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:39:43 -0400
Received: from mail-qt0-x22a.google.com ([2607:f8b0:400d:c0d::22a]:54244)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e0B3Z-00011d-AZ
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:39:37 -0400
Received: by mail-qt0-x22a.google.com with SMTP id 47so27152938qts.10
	for <qemu-arm@nongnu.org>; Thu, 05 Oct 2017 11:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=NFhX8dyP6P1JiD1gnlTcAV2BLdiD+wxRyQ0FG0dBfzM=;
	b=Om4mpiJEwx6+QAT/lyRkQIv7thqJjJJqNCpUWXEukgmLFjgeLcJ0hf/jLpXNz9RfA2
	N2P30MPvj7F8D4oOg06IYgfQTUSQ/mJAY7/4XlhmO6LSlm6+wCJO6g0JKU57mZZNq7y/
	rRus5ZgdeKojDG/9sAFE4F20WewOwKTKXojhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NFhX8dyP6P1JiD1gnlTcAV2BLdiD+wxRyQ0FG0dBfzM=;
	b=IGxCFTQipF3HdVCsGKIVHEQ/MkoYTXiMngGFhH8P+FtWCkZvvNLyZem2/Yvm6HKncC
	O0PPU5iqTNYa8B+QRr6gyPCu+SG8M8jjDizgQp/S23AtHikEUIfBzoHwSTlZ6stekHl2
	nvQ949GUO+zkhM3QN1WUtMoAHYnc64dNrKUgGnW5IToW3ssGanrE6oh8YbgEHAlbFg/q
	ofMgv2T47naIARCbXk/ntYdoSl4sOQC0si/FUBqoMc4cvEDa88NDqyce+A/IxG6jjYiW
	iIUc+99W44AkelyECNsGlqb6ruYW1MOKWb6ePgxEcg25H64BoDT51o2JvGHwfqlX16M0
	yYgw==
X-Gm-Message-State: AHPjjUgcuhQL8lViAIqwbCB3e1aHvRPgEfn2RNDQ6WoCDwcozcsEn/QL
	5q1uOY9ag7SXIq5Mt7EWbZGYzA==
X-Google-Smtp-Source: AOwi7QB43deLVlBhwhOSZj6qE4O8LC8a1/jCDiz/TXhcRMN2LNAT3Nm3aqDZzGdWbkpCiINx5YIqdQ==
X-Received: by 10.13.198.65 with SMTP id i62mr20863597ywd.59.1507228776501;
	Thu, 05 Oct 2017 11:39:36 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	s187sm8971158yws.55.2017.10.05.11.39.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 11:39:35 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-15-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <562a5db1-ab3b-1d77-eb8e-69af276bcac3@linaro.org>
Date: Thu, 5 Oct 2017 14:39:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-15-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 14/20] target/arm: Implement
 security attribute lookups for memory accesses
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
X-TUID: cDFlf9Zn9s8u

On 09/22/2017 11:00 AM, Peter Maydell wrote:
> Implement the security attribute lookups for memory accesses
> in the get_phys_addr() functions, causing these to generate
> various kinds of SecureFault for bad accesses.
> 
> The major subtlety in this code relates to handling of the
> case when the security attributes the SAU assigns to the
> address don't match the current security state of the CPU.
> 
> In the ARM ARM pseudocode for validating instruction
> accesses, the security attributes of the address determine
> whether the Secure or NonSecure MPU state is used. At face
> value, handling this would require us to encode the relevant
> bits of state into mmu_idx for both S and NS at once, which
> would result in our needing 16 mmu indexes. Fortunately we
> don't actually need to do this because a mismatch between
> address attributes and CPU state means either:
>  * some kind of fault (usually a SecureFault, but in theory
>    perhaps a UserFault for unaligned access to Device memory)
>  * execution of the SG instruction in NS state from a
>    Secure & NonSecure code region
> 
> The purpose of SG is simply to flip the CPU into Secure
> state, so we can handle it by emulating execution of that
> instruction directly in arm_v7m_cpu_do_interrupt(), which
> means we can treat all the mismatch cases as "throw an
> exception" and we don't need to encode the state of the
> other MPU bank into our mmu_idx values.
> 
> This commit doesn't include the actual emulation of SG;
> it also doesn't include implementation of the IDAU, which
> is a per-board way to specify hard-coded memory attributes
> for addresses, which override the CPU-internal SAU if they
> specify a more secure setting than the SAU is programmed to.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/internals.h |  15 ++++
>  target/arm/helper.c    | 182 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 195 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


