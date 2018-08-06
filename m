Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3101268wru;
        Mon, 6 Aug 2018 07:06:56 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdtYbpM47QACdWb+2QW1cK9EM7WCUIOaSxGdEuofaNqPCjf52Eizx8+JtuN9g2sZJGU8gbx
X-Received: by 2002:a0c:89f8:: with SMTP id 53-v6mr12433589qvs.233.1533564416593;
        Mon, 06 Aug 2018 07:06:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533564416; cv=none;
        d=google.com; s=arc-20160816;
        b=Q6TyeOnJ0SyKyHoMI2Y4ssaLAy66SzdoJkM/ZtL/X4vvDozdu33O9Cd8NpDCOUvtzC
         2SW6XILpgKpsfU2p/fpp7QlOESVSXdRQTC8LVrZSXgNfjeLd7YpHlYfqd8ZrQr85Lqnc
         YVcrVTZPI2iVyk4OV/bDr+WYnc5S5HJWjJbHKcZrZPDHMWUu2pYNrBnb0DHFaTzAyvLJ
         YwsEp2PQ5d8CDpcNLjMZz3K12jfa6O20OwrBFZpcFsLt/OefGwLX7Q4k/W8nGtMjPDcP
         rFBtR4CQbxma41Wncy4wZNT/lL9btV4lezSIwSl84Rs1h72Gat9Rkriy5JEs+f9KHSET
         vz7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=rbjNl4ATcAPA9wOynOnJwbCTuDhe4K9DDfkCSSn/GNE=;
        b=XvxtZkJ5vE2kW1IVWReU2igiUlOiHcYGeBP9G4M5A5l55ihfLD34x3J6Vv3/CcbQRK
         b/2Pk4kFd0ReSBbL24Q14rXOEzvwjO2o9HFmJ7MsOiWnxOmmkJBieysgwlK1w4RqdRbA
         s5oK935+1sapHBrFml9EKO9dvw+YSf4IvRSDedcOiulVCw66gwRqBi2OPHZdwB/oMXIt
         3Nxsl0iA9PbRrFcby55OR0osj4Zmpd/DoEM5O0jnLmbrQ70ldEld1X4nsX76jYnvGrwp
         TtK8v3DS3dQh0ebuSATcVs6PJuXm2Ix8L7fghym6vq6aMi+uzX9Q2/F5OVhyWRxqEBbe
         fchQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e2e21eKC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y138-v6si2636878qka.298.2018.08.06.07.06.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 07:06:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e2e21eKC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34274 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmg9w-0004ie-3O
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 10:06:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fmg9l-0004gY-Bj
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 10:06:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fmg9h-0006ky-Ch
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 10:06:45 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:34779)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fmg9h-0006kk-5w
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 10:06:41 -0400
Received: by mail-pg1-x544.google.com with SMTP id y5-v6so6299266pgv.1
	for <qemu-arm@nongnu.org>; Mon, 06 Aug 2018 07:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=rbjNl4ATcAPA9wOynOnJwbCTuDhe4K9DDfkCSSn/GNE=;
	b=e2e21eKCRNhwtdZM1wm6k/NkDgQJihcnatCq6guIMwUBpW5gWLwmdLxTSnrob9nCoz
	VT8jZKARnjsDRcpmEaCPW83fN3rXzwPfljSK3ouVrhxDCuWawWRo/rtf5O5wwKjXN6vb
	t5Bxj7y8ChirL/qC5ogT+G0KvaTvvB1yww0Ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rbjNl4ATcAPA9wOynOnJwbCTuDhe4K9DDfkCSSn/GNE=;
	b=nOLqnAOKdn6QvRlw3modKM2JOZuGgm238ATLPYxiaI9apohXlIN3SEmtLRODZ061hc
	uS1VxIKo1NpyhW6UwgN1Zw1YgSyTKY1fgtgBxzGerOY7dQSYyiV50FlSK8YTwmpBXyxF
	NVFyv9lTDNZD6qN5KEiDc69+RtxVxomCi+sRF9tfXx0ZbofhKGli+KI3BjG1u5mui1sI
	BqTKhci9LjwsDwcQ3HZiJ4RF9eUyqOc1v0bBdM0fsVJ/U5C9ijrP2t7CSTkI9UGD6koc
	ki9Hf3fu1sW+WRj3OqX5vRnK66/kd3quxeWPUwW3xYS2tR1ukYk3+WWuqTnOto1rT/i1
	owTw==
X-Gm-Message-State: AOUpUlEKRptbA/1sf8i2+zWc1NwM1vNIjvIl2XZdl6kqW/0XWg9HR2nL
	6Fd8YXvRxj5aiLt77138lYATxA==
X-Received: by 2002:a63:4283:: with SMTP id
	p125-v6mr15007595pga.142.1533564400094; 
	Mon, 06 Aug 2018 07:06:40 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-8-179.tukw.qwest.net.
	[97.113.8.179]) by smtp.gmail.com with ESMTPSA id
	z11-v6sm24726959pff.162.2018.08.06.07.06.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Aug 2018 07:06:38 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180806123445.1459-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f9f955a3-001e-aa12-97ef-97a085b8dc6d@linaro.org>
Date: Mon, 6 Aug 2018 07:06:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180806123445.1459-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.0 v2 0/5] Arm migration
 fixes for 3.0
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
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	patches@linaro.org, Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u//hzqD9Tlw9

On 08/06/2018 05:34 AM, Peter Maydell wrote:
> Peter Maydell (5):
>   hw/intc/arm_gicv3_common: Give no-migration-shift-bug subsection a
>     needed function
>   hw/intc/arm_gicv3_common: Combine duplicate .subsections in
>     vmstate_gicv3_cpu
>   target/arm: Add dummy needed functions to M profile vmstate
>     subsections
>   hw/intc/arm_gicv3_common: Move post_load hooks to top-level VMSD
>   hw/intc/arm_gicv3_common: Move gicd shift bug handling to
>     gicv3_post_load

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
