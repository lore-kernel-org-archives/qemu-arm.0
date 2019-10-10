Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1619861wrm;
        Wed, 9 Oct 2019 17:45:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzNB9PcJ0VjYmwLvtNX9n2tdl+27hcAGFZg075DCenfQigtBzAv5nirNq4xXsFp8ZG8DlqA
X-Received: by 2002:a0c:eb89:: with SMTP id x9mr6899761qvo.87.1570668327207;
        Wed, 09 Oct 2019 17:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570668327; cv=none;
        d=google.com; s=arc-20160816;
        b=ziAkp7khiXb6FPJZLV0/BHk3gUswa7iOgN6Q/rbabSsXpNZqwgcD0UgRZHRyWOyL9w
         7tWJi7yjPslNmeNdTB3zf+rs7zmXoCYe2DtXCgOivordgK5bHxpPxdk2h33ydayPzX9W
         +40nV+bP4v3k2VOj3sXwx5f0ES7OQV4fFznqJLKs3CXoRjH8C/a7dLtizUc1SpMeRh5D
         VSYqo9DHIAaJa6c2q0u2TYem/CHaXNmb9d4xlQUJiqsCcNtGJgYy+kC/8Y/4SBbhqQIA
         vZiU+HHHIitrnrwqy4s+L287hCC3HfVXcBn65l1BG1Jo2VJz//C7ogxpjslhnZ08dhtR
         xUmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=EqF5wQy3S5cpOWsddpe39MMWz/IJTIVyMBKbLO/w7lw=;
        b=OI1f95lO0Hhs7VqughL/DUI/cBLujq7sGhdFG+SLALMDMcBYIk/t1fGpTkO7ZdsX2v
         hDSnmXH7M5hmPQdlwJuh8rbpCYwVHeSjrm3U4rv35C8AcNsPs+GFns2HNlsN3d8C1WHr
         beImoWTnwedpWeazVbS3naB0HvdWtj5kCV60wasPDtMPQG2nxrOZb/oqYvgDKmrhfrx8
         7UeTNlM+/cCPuEFNiQvsgPa297yoMzM4ODMqM1ZKw5erb1TtFdDzYQXo55BW3Noo7s20
         JzKr1gR/on4R/c1YJm011w2IautvWjbkUsY1GQYFxZPKFaaQzbemKMIDJmDvwtrBYsu/
         TaLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=clJQC5+M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1si3714103qvo.33.2019.10.09.17.45.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 17:45:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=clJQC5+M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIMa6-000261-LD
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 20:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46989)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIMZx-00024d-Jv
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 20:45:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIMZw-0003ei-Iq
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 20:45:17 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:47044)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIMZw-0003eR-Cp
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 20:45:16 -0400
Received: by mail-yw1-xc41.google.com with SMTP id l64so1406567ywe.13
 for <qemu-arm@nongnu.org>; Wed, 09 Oct 2019 17:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EqF5wQy3S5cpOWsddpe39MMWz/IJTIVyMBKbLO/w7lw=;
 b=clJQC5+MNe/c3hIlHkDRaBkzCXl6zB3VtJS58pNnw6691LBsFJp83NivXpcvbB0NT0
 SwfpRZoXAfTNXzRljGdSVjqYudbMpwhDRWPV8mGIxZ263GPw7TzKMNP2EA7bwb42k+OE
 0mGGkq/eAL/GZDqxCM27mm5u3efWzo/Kq9siS1PbrLA6hZnYLz+/dsO+FkS1ImLt/Uxt
 RqaP/audbgQy4HIS5pZkb45jvjmSadecFv+RkuAaEJ7sGScEjnO4YQWf3TClyGezbkt8
 G17+/GLPdFHNqVmO8GhiY78ShkAF5mARsR5xyzgEX6So9ylAeJGL/MSQKN01B3XNvX4P
 ng/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EqF5wQy3S5cpOWsddpe39MMWz/IJTIVyMBKbLO/w7lw=;
 b=HYl+YKWcL6F4nKms4wcej2htHPZFUi2gctUuH7yzDCw7AH4IMlMNV7hIbd/JcrDL0s
 jH9ooSUFuMl2Lqn/JbSLuNewG8rACMHq+d9cy0wNF1mwuAEv1+i6JJ/+bGXinB9owZ1t
 s1snwwwIwIs+solMRqbgQSB5WAzwd/5CbI1WZPWezJu907E7PFiwSYNi4ybxsz/whiMi
 475H/x2LXSBGf6Axg/jWndLvpF3FNGEHW/yB7jiLuVv748yx0HjhEbQrOPCupl3+hAft
 5XJTuhSTAVaZLITWFwuu46bAB0WBb5JtSDQJRcSaeC/Eqh8fjSTp19Zc8Xi5KUcRuS9W
 IsNQ==
X-Gm-Message-State: APjAAAU9dsof5PDjDppwKQk5s4yswgPkTCf9PXb375LIFqSjl3skX5LB
 3Lx/9eXYoZXtyqESyqJ+uq5YEw==
X-Received: by 2002:a81:4108:: with SMTP id o8mr4836728ywa.182.1570668315514; 
 Wed, 09 Oct 2019 17:45:15 -0700 (PDT)
Received: from [192.168.1.44] (67.216.151.25.pool.hargray.net. [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id q124sm1066397ywq.8.2019.10.09.17.45.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Oct 2019 17:45:14 -0700 (PDT)
Subject: Re: [RFC PATCH 2/5] timer: arm: Introduce functions to get the host
 cntfrq
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20191007170622.1814-1-drjones@redhat.com>
 <20191007170622.1814-3-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <670594fd-3c29-13bd-e67e-69c96140c738@linaro.org>
Date: Wed, 9 Oct 2019 20:45:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007170622.1814-3-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c41
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, bijan.mottahedeh@oracle.com, maz@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hvpWD/mtdqQm

On 10/7/19 1:06 PM, Andrew Jones wrote:
> When acceleration like KVM is in use it's necessary to use the host's
> counter frequency when converting ticks to or from time units.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  include/qemu/timer.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
