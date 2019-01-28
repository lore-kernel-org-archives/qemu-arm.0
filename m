Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3471068wrt;
        Mon, 28 Jan 2019 08:33:55 -0800 (PST)
X-Google-Smtp-Source: ALg8bN66XRRnO1F3z6/L4Mu/l9txlFOe+HRQHy5cn9uyQpMcLP1PTCGN0DWsZHmG8GrRW9WStAas
X-Received: by 2002:a1c:13d1:: with SMTP id 200mr17395330wmt.4.1548693235593;
        Mon, 28 Jan 2019 08:33:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548693235; cv=none;
        d=google.com; s=arc-20160816;
        b=e3WO2xQ+PnndbE0fhMGBWcyB4SVr2M+cLpSQHovHjvACgLieSorZ019p2ZlSd/rLl8
         p7Z63lfu5da+rZBb73KLD4Ecy/OmrT5Y0ySLBn+vCMS6iTJkzhViG9cfUwzaTruyBT/4
         HKw6smLJK5ctZDKJVrkZ+ji2a2Uy1yccV4YfHW0nrVaOOv4qLMlWFfdzDKaOD9WucMd9
         j6pF3cqNLoLehjdbpuXcQjQRIFdNdLyQJ17xnSrq30iHZR/nvPUg0nscQNZ4v0aoPcKJ
         7X9iBgJmEAsX1y1fe6PKckSqCu6DnCVLBibdRRJzRFvp1NOCQs6njWqxQyj7xctc3Zio
         pSNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=oUVMj69o3/rGsy/GT8xlRS9vAKtSa8PRtHTGJEsj20I=;
        b=m6Qhwi4H7ABBqaCZTIUDIBWUDwXsFKgLYCmOQN5SiXWEPv5szYPfv5kasKA5M8hlNU
         nr0Mx4JpzXkJEX9pj+rHKu2EfP9lqiIUSI/77EDK5uTr86o7qJdJP3bxtMqH9UKdch6w
         fyTmlJUgwLFh19tuDLQ06wnySzTXEBtNbzWLD0Aj7sOWcHBrXRwRUgcEmrpOfEzaAeXa
         SL/fqZYd7KRe+46IocGfrYhQ/Qd+6g5vqjzVZmDLL0by44H1kPvGP9Js9q0y8JaaKBdA
         JT+FeMHJnQCxmOu8174PwxoHXus9TsE7uJ0eY0OgrTB9s+DgImPXLfUCpgcL12NO+Pzf
         lPPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YQ5Fk9jl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d4si80453618wrr.282.2019.01.28.08.33.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 08:33:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YQ5Fk9jl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:34694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go9r8-0006zV-Iw
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 11:33:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1go9if-0000Cl-D0
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 11:25:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1go9ib-0006Hx-Ii
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 11:25:09 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:39010)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1go9ib-0006Gp-AD
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 11:25:05 -0500
Received: by mail-pg1-x52c.google.com with SMTP id w6so7413787pgl.6
	for <qemu-devel@nongnu.org>; Mon, 28 Jan 2019 08:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=oUVMj69o3/rGsy/GT8xlRS9vAKtSa8PRtHTGJEsj20I=;
	b=YQ5Fk9jlzWFXpwWPVyxwasVo41UuAWz5Wp/9E3q6RvLLrwrXFjFw/vwdWzkzSbrADs
	tlm1hoKOaikPQFPf7n1d7MC/Kfs8ZvAMenxq8PVDRxuSWcviX8tiGZRBZkCefgz9jlg+
	eeByuSSQpod/erYNC78gbj6L6ACQWq3coL3HU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oUVMj69o3/rGsy/GT8xlRS9vAKtSa8PRtHTGJEsj20I=;
	b=ABjpmRQd140qjztUmqLY+YoDzIv+a+h/7hbACcnZmaKbNT7mIeOiQVx3wlerztqpsz
	9v2ju1o2XEwj1aIXyYygn/QLSLyuH490DLb3bjT7slmhqu+43QwDCCjQ0mSOt8l9I54j
	9b8pnm7QBps3Z3lfAHrUwVLylMyU/X0poG3shPFb1V7d64RrBGmRNHJDTi65ZFjA/ecR
	2KZqeLPvkNH/vGzk83+p3siGH+s7C9MaWBS9oJ3obUYD0cGogsRbtzLC1deKp6hpqr94
	aX3hugKlkDlovxKmT3UR0aRZs2gI0tPbCLH5ctdg2Pr2MHXyNv+uJR7j7jBkVqWDi2L0
	yPbg==
X-Gm-Message-State: AJcUukc+zDmv1pyZCdq9OGZafNdXbW2OOKoPneGPDqyI9PSABJXq1DWN
	8ZOKkk25e+z1cx9enRpbcXungg==
X-Received: by 2002:a62:4549:: with SMTP id s70mr22266617pfa.233.1548692703881;
	Mon, 28 Jan 2019 08:25:03 -0800 (PST)
Received: from cloudburst.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id
	g28sm53829510pfd.100.2019.01.28.08.25.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 08:25:02 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <08e7d0bd-8f29-d867-436e-e229ddfb6335@linaro.org>
Date: Mon, 28 Jan 2019 08:25:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52c
Subject: Re: [Qemu-devel] [PATCH 18/23] hw/arm/armsse: Add
 unimplemented-device stub for CPU local control registers
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
X-TUID: rIprWknBx7hY

On 1/21/19 10:51 AM, Peter Maydell wrote:
> The SSE-200 has a "CPU local security control" register bank; add an
> unimplemented-device stub for it. (The register bank has only one
> interesting register, which allows the guest to lock down changes
> to various CPU registers so they cannot be modified further. We
> don't support that in our Cortex-M33 model anyway.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h |  1 +
>  hw/arm/armsse.c         | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


