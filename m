Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2274393wrt;
        Fri, 23 Nov 2018 08:46:36 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VwisS5mm9SLI+Q6Wg8hEoNuJIlyNVCR8EreIBBhcedNFQ7hVJ1Vqe3SboVKfh6TjV9kQMY
X-Received: by 2002:a81:5785:: with SMTP id l127mr2694071ywb.91.1542991596681;
        Fri, 23 Nov 2018 08:46:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542991596; cv=none;
        d=google.com; s=arc-20160816;
        b=EB64WUQ97D6aB14vdsQMTF4jJG0vL1iAocEkigcN/BhQcpMC/ua/b2vPzVpHOocxpF
         xglm6ZIVZkQUm4iGeYl3o9rXLKvpTsbocumRP0CeAIKNnJiWEBNdDFQSXzX2KTgMTzYD
         LcjUdkojq6SFfeo36elf7IAAc3IvFDBCii0qKZyr14gdM2ScJ1dS43bCVwgIB6qgofpf
         rFaeRvVfYH3SEDF3qiGljiAvnDwca20p7gTjzVObaZfeEnbbDWr++DPKbLWP46zQB8Pp
         VGEmrjj56BrrcV2LsbagNUOIvx/PCZ0LLhkguYrDitR533zLbGRYGcoUPsnXfegjdIQO
         3pzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=X2Dz5uKhLibaKEI6Lc8suM0lMVTTMKyi0LNj8oGlADI=;
        b=iIMR65PIaHBoBWgD6knYlUveRu86ANwTiYmIZu6Ejn7KywY/Kk0rcCq1z5fhzrta+2
         xSrIE7JUjnqakS7wTJse2LpFz7OWj2zKh99ITE40ENtkjNK/r0IKOHxSI45VcIIukuV+
         MfO5opuE5LoTdBV8qbqurdigChbVDR2lAk2rYOgBKUb12rofS8QwoQ/MMKmbUOmxpZRq
         CXQe74U6IYovoxZIoY/cuOgFBs3QlmKDWdWADwDs5XL+yRu7vqGLyhtlA72jpQLPMqfb
         gwF32D4lWIpUhdnsUdiz9WpfNc5kh6ziXSgaiZ/zLSllF+OC4l9qi245MrD8aS5bSHxH
         mKSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x2-v6si32386706ybl.354.2018.11.23.08.46.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 08:46:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53415 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQEbE-0005o3-08
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 11:46:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gQEb4-0005nt-DS
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 11:46:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gQEaz-00081c-F8
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 11:46:26 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35883)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gQEaz-0007zf-8B
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 11:46:21 -0500
Received: by mail-wm1-f67.google.com with SMTP id s11so12598839wmh.1
	for <qemu-arm@nongnu.org>; Fri, 23 Nov 2018 08:46:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=X2Dz5uKhLibaKEI6Lc8suM0lMVTTMKyi0LNj8oGlADI=;
	b=Qs1c2g/f/XfOmCqljIxEGxj91mx0dGhZvnoZoM4M5qByvn7fRdWRABKPqLU/8GL7LJ
	aRm2V82n0FIr7K3cesA8+UTozfdKjh2r/DaMD/7lnrDtxXTGuF1G8zd+OGe0qYH+OuZ8
	K1FbH3NLxv/pXT2C0AWaPi5n136YIVGpdlY+/qH/wR9H0K+PYY+n047i44g4u5zDLVld
	5ytWUET3eSDUexzT3Kfm1L9inV9br1eppt8XkhrHXldczGMeuCxyTu42RJfUuU+E21B2
	sLbstsPlrhvyQG4V4VIwtFO5Qjzw4HVOH7Sw08PL0kDwxCK+QQMU2cdOItJFSlQn3mmP
	048Q==
X-Gm-Message-State: AA+aEWZXEnqgFdzmzju8CL2cOrD7ug82n5S95LQdZmAZhhOLzH3pAM7o
	6f582/zppF3KJXCDATWu77QAYQ==
X-Received: by 2002:a1c:d78b:: with SMTP id
	o133mr10044593wmg.121.1542991580303; 
	Fri, 23 Nov 2018 08:46:20 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id
	e14-v6sm31626919wrv.93.2018.11.23.08.46.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Nov 2018 08:46:19 -0800 (PST)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <20181123135450.24829-1-edgar.iglesias@gmail.com>
	<20181123135450.24829-2-edgar.iglesias@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <75bcddbc-da2d-aeb3-71d3-52b635520d2a@redhat.com>
Date: Fri, 23 Nov 2018 17:46:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181123135450.24829-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [PATCH v1 1/1] net: cadence_gem: Remove incorrect
 assert()
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	frederic.konrad@adacore.com, muhammad_bilal@mentor.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HKqkR+DxNHH+

Hi Edgar,

On 23/11/18 14:54, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Don't assert on RX descriptor settings when the receiver is
> disabled. This fixes an issue with incoming packets on an
> unused GEM.
> 
> Reported-by: mbilal <muhammad_bilal@mentor.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/net/cadence_gem.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index d95cc27f58..7f63411430 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -979,7 +979,6 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>  
>          /* Do nothing if receive is not enabled. */
>          if (!gem_can_receive(nc)) {
> -            assert(!first_desc);

Maybe worth:

               trace_gem_receive_packet_drop(size);

>              return -1;

Shouldn't this be 'return 0'?

The "net/net.h" doc is scarce...

Regards,

Phil.

>          }
>  
> 
