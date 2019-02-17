Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1514966wrx;
        Sun, 17 Feb 2019 09:51:34 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYFmB0UFwccP0hiRL189SqtEY7gR79sIjwf9ZLhpbP9dYcIQ1hH6oAOjYHiLonhR688bjND
X-Received: by 2002:a81:1c42:: with SMTP id c63mr15257950ywc.424.1550425894828;
        Sun, 17 Feb 2019 09:51:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550425894; cv=none;
        d=google.com; s=arc-20160816;
        b=i59ab+kj/DLbtZ0oVj22rkAMcMCOQtd5zeJrx8hoZZ010g0aU5RPL2v7YkIqwyIeTg
         yHMPJ/w/SwhN0b4WlAL0ZjoOC/RpkrZCTjRXDADRDnRsLzFJkpcpNESgBd3rAG4hJv5G
         6N6hfvCETDmQxc86Ei3qTV2dE9/SZeT16PS4RKrDTQp/CIh20sv5jnymw7dHvk7rMaR7
         fn57Wp4R82dzdkG0jI0s/hdX+8fKpdZjYVgfhJzLMHsB6AoSoeRCxuXppJ+06yN0cXt4
         e4nm+l8xAQ/gMW7PVmHtWNg78iAamNSWXEuWwbX3CYdJcJTM3Ijin/72uUe4LF5puxrA
         Wp2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=MCtdrfY393+qSJGgnN1XoRbw3XQegi4S4XqFpbvH++o=;
        b=JtFU8XxQyMwCKWpI9x3deCc+viyTvNwN1mT/bBgwfQAoAj6d/KxtaKWDvjvA9vq2fk
         fmETBA0VI5tmCCNs/3E+3fPhKi/tILxUHlRzPNQuBtGLP9muwXllLHRL/UrItYPqB9z4
         eGEQLZvW508Aty1ARD/nRgS/YL7wsagsPyYkXmHHj1/U8AHyTuY+NsP86IFC673T4mNC
         ZY9fwdCjEy5FoO0TSLBpC1PK79dxvxsWx9AODeA3HomZHVO1/5U7ZnqvHWRVhXQaIJyv
         Cg3IyULnlaeVp/JfFJQEvmXSZEjfkxHGgRRt8jmGJLP+bxer1EJNic/9MhVs6nUx2jza
         kvwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GOE9bXfT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c74si6286399ywc.400.2019.02.17.09.51.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Feb 2019 09:51:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GOE9bXfT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44579 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvQbG-0003WJ-BQ
	for alex.bennee@linaro.org; Sun, 17 Feb 2019 12:51:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQZd-0002qk-F1
	for qemu-devel@nongnu.org; Sun, 17 Feb 2019 12:49:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQZc-0002m8-KU
	for qemu-devel@nongnu.org; Sun, 17 Feb 2019 12:49:53 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:34480)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gvQZc-0002l4-C7
	for qemu-devel@nongnu.org; Sun, 17 Feb 2019 12:49:52 -0500
Received: by mail-pl1-x644.google.com with SMTP id d15so404526plr.1
	for <qemu-devel@nongnu.org>; Sun, 17 Feb 2019 09:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=MCtdrfY393+qSJGgnN1XoRbw3XQegi4S4XqFpbvH++o=;
	b=GOE9bXfTiDJVkoOI+vhtQupeRj3TDLJwlMWevzmXaRUzeS64FiPVq2/fz0MEOhIK+2
	v4kGxvcvvugOE5Mlo5iIyxim9Rf7QDomYyQUT+6yz/G0hPdz7w5DVcKFiosx9X2XxwUx
	cG8pf/X70gnVUEJfwHrrjzAoGFgktT7VfDX6yHvqHh3OF4PxidfUidggsUWHDmHxbbdc
	fSHKHOw2wzV6+Dhn0ehYOEZNOYVXw3ZcCM5zsnFbxZtNFA1EiLZf6wPubXnC97B9WfQY
	fqIqsVIhgRz+aPVuMlI9NWyNE17bVXFPfKqsNQ5juu69KwHjR/Bw58m1ySSOR/FuW/LK
	164Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MCtdrfY393+qSJGgnN1XoRbw3XQegi4S4XqFpbvH++o=;
	b=UU0TpnSWVWZlcGV21hXwZ9Q/K89ilYMIIn+8HAdrSI+1WM2vjXFxdfnUNk4xYkmRBd
	Ze12+HeO6qB/MDsytd9U0Ea1ikmuHLSmtzZmQNqw+CiDjlZ1iuxqw5cpSd1XfoBBzDgf
	9Zc/IIYgi4nPZ5WqB35F5ntOs8Ho0SVJDXM8i7CoPmY8rzK8K98SRMBwYm+FmTnhHDLM
	RE/4ZjwkneyILAL5AnOuL4N4KDsErmwSV8M2oi74aqEbW2kdjOc3uNJIH4kHi8rsvv3V
	IqmmVFVb2q1kOqoPYLim+jn982G/2etudQmqzXAOAK1dyoOa0hTx72e7vjUiX72rYR/W
	FOyg==
X-Gm-Message-State: AHQUAuZUdHCtZMhyJUnCrzs7uUlTqh3aVcvpIBDOsTajSE7oBRo0hzvy
	/T8ndoRxVdmJqKsAyuGaHVTMFBOBhdU=
X-Received: by 2002:a17:902:2e01:: with SMTP id
	q1mr20874272plb.240.1550425791381; 
	Sun, 17 Feb 2019 09:49:51 -0800 (PST)
Received: from cloudburst.twiddle.net ([47.39.62.139])
	by smtp.gmail.com with ESMTPSA id
	e9sm14582412pfb.52.2019.02.17.09.49.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Feb 2019 09:49:50 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190214113408.10214-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <32ee50a4-f8cd-ffce-6b42-4611611b2e34@linaro.org>
Date: Sun, 17 Feb 2019 09:49:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190214113408.10214-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-devel] [PATCH] target/arm: v8M MPU should use background
 region as default, not always
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FSISaKArTF3Y

On 2/14/19 3:34 AM, Peter Maydell wrote:
> The "background region" for a v8M MPU is a default which will be used
> (if enabled, and if the access is privileged) if the access does
> not match any specific MPU region. We were incorrectly using it
> always (by putting the condition at the wrong nesting level). This
> meant that we would always return the default background permissions
> rather than the correct permissions for a specific region, and also
> that we would not return the right information in response to a
> TT instruction.
> 
> Move the check for the background region to the same place in the
> logic as the equivalent v8M MPUCheck() pseudocode puts it.
> This in turn means we must adjust the condition we use to detect
> matches in multiple regions to avoid false-positives.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I found this because the incorrect TT response eventually resulted
> in the Zephyr RTOS writing an invalid region number back to the
> NVIC and tripping the guest_errors logging.
> ---
>  target/arm/helper.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

