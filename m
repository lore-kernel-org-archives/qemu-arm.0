Received: by 10.28.71.27 with SMTP id u27csp906940wma;
        Sat, 3 Feb 2018 13:29:47 -0800 (PST)
X-Google-Smtp-Source: AH8x226mtKiHYLyxi5Sz9+unR2f7q+lBDSC6medEJqXtVTUqzvGfZ5yv7n008Xt8/cWM9sXNu0Ka
X-Received: by 10.37.95.70 with SMTP id h6mr28704346ybm.508.1517693386889;
        Sat, 03 Feb 2018 13:29:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517693386; cv=none;
        d=google.com; s=arc-20160816;
        b=dXGPRyt+qPdQB4Yu/rP4QQ9n3OBMefxuWxkiOfmPorHGooxoGLbe9E3ECGCwM/Hyrn
         Qx8N9aUGF+HtcuIoBzKtlA2tpbUSQQiXlLb/WLXI8zk/IfkJ9fuveECpAkY9j7ZPEEaj
         l9pycs9bgyDneA2UAHXjE6dqAMSgvNNofqhLzqP/SdW0ulqZr4FwIh6YK8HcQN5g3PgV
         iQot6kUNT8eO5cpZjhhocgfr/iR8OW6OQiUHbE7wUJeEI9Hymgj4tIAvYsboIsoZUFIh
         GoR45XWr7iecpJ0wW6Co2gsDA7M5kfklAQWgF0zzsReRsstecKb1m1sYMHsT6EsCOEPx
         yFvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=IImraTw6PB3R85LxTKL2NNOs9GhxrplcPVX2xG/z+oU=;
        b=jySPmU0jKxwP79Ttg62wgRt68jOTf3FR7PgojKrGYx34wzCMuSKWk0QC1l3lhkzFTf
         jLIUhjyDDL8oFAWGhxyymxcXce4psJjO/oGw/ibiSqFtqa+uKVlk0c3nzFrDCh7LkTK7
         +KxLyxKcL7p6wxBOEBm3VzL6Gm/kNvtcJGYDuq1DvzyY7MpOyY8v3L2e+R1uE7t2VE2w
         0CwXKO20SPpSEFYgc621eG0q8GVW+QgH1m3b30KDZH9Nd3mOfZxcR/eGF3FXrAceW6oY
         IdW418bppZ8RK8E+vKia1jOJYofEDug2pXpI/XhR0vcGUM0LC/WUgGPDwrPFT1Z6xCJ8
         i4xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VPQkLWpY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t137si910425ywc.139.2018.02.03.13.29.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Feb 2018 13:29:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VPQkLWpY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49594 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ei5Na-0007Js-AR
	for alex.bennee@linaro.org; Sat, 03 Feb 2018 16:29:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ei5NO-0007J1-B2
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:29:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ei5NL-000839-6S
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:29:34 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:44533)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ei5NK-00082f-VI
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:29:31 -0500
Received: by mail-pg0-x243.google.com with SMTP id r1so156190pgn.11
	for <qemu-arm@nongnu.org>; Sat, 03 Feb 2018 13:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=IImraTw6PB3R85LxTKL2NNOs9GhxrplcPVX2xG/z+oU=;
	b=VPQkLWpYgqpaDmHcbFnx5N/nknx0Ez3osbklkksHeLZnaEeSNAb3IshE7eFEBFZBUv
	T9RE1dLA2HmAlj9iNLEMaKhVq6QdLho4+j+u3h8WKEO4FiZXJm7bnxyMIfeA8+xnA53x
	sSH3/GxYqmZz1gY7rBVu1eM+p99cJ4gVZL+00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=IImraTw6PB3R85LxTKL2NNOs9GhxrplcPVX2xG/z+oU=;
	b=aPaY1NzqUBVCgzEeVcOaJBVsjOj+ZX2IVRiXGRaXRxwBmAx9UoiHeGaBliRJ9fQ7AV
	LILlBuz7N5o7njPTfoVVaDeZkQaQLlnhmwK0G6GdErwUk5R+GO3/0GGVzHRwWFObbggF
	3zFblZxT+ZgXy46bJIYTS265ziXTV421z4UrqyH+s38BRAIKy40QZD1xKOelKDGEQJCS
	NxkuF7udUAc13Ybi4lWhT8Y105WKrPZYBIP6NKtlh/maWUW8odgcwwa4kyT7qKiIVULf
	vcFAADv9yftBng5TpCCyyt4qf30emTL0VY3auLczKFK3KAi0onsj+u7eZi2Z9u9QNBDu
	Haug==
X-Gm-Message-State: AKwxytdW3/0cMHqRWXHDCDCRO+Flr6uPNa8vW6wRl+s50sZY80vPnjRL
	DAvaXtmBnPMj/V8y5OFE2JT/3hBH7H0=
X-Received: by 10.98.59.5 with SMTP id i5mr8501883pfa.146.1517693369958;
	Sat, 03 Feb 2018 13:29:29 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	t25sm8354025pge.41.2018.02.03.13.29.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Feb 2018 13:29:29 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
	<1517324542-6607-7-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7d8f08bf-1532-c99f-1267-a2758317f99f@linaro.org>
Date: Sat, 3 Feb 2018 13:29:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1517324542-6607-7-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 6/7] target/arm: Make exception
 vector loads honour the SAU
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
X-TUID: tBSv0wEwKsa8

On 01/30/2018 07:02 AM, Peter Maydell wrote:
> Make the load of the exception vector from the vector table honour
> the SAU and any bus error on the load (possibly provoking a derived
> exception), rather than simply aborting if the load fails.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 71 +++++++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 55 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
