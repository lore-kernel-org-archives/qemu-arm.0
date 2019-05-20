Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp449567wrg;
        Mon, 20 May 2019 10:44:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyB5Z/pB1A+J5uYFKGyMQmVPq4mSSg899fLEJCjdJkNDiDx6Kc1WJw4EQOw6p6kTLz4o5Jw
X-Received: by 2002:a50:87ab:: with SMTP id a40mr74935455eda.188.1558374262777;
        Mon, 20 May 2019 10:44:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558374262; cv=none;
        d=google.com; s=arc-20160816;
        b=SBE0wwGjaV96hF0/1hvmsMouxvjRx7u4V+vHN/vLLeZDA7mgIB9u+CNrRsqdLzQYcH
         9tO9sNjIXBzNU2i2ZFyA/XkUqaVMhbW9ThJRmctRmZuXS1kdnSnRJn3pYmg/y0QXTYyb
         iwNDo3L3G+CrkaGOwyx6LfqfOViKey1ZHe8XX/aslsOsAS7hScafsZHsmXDkz7jbjohl
         aYV3PTkwiUihKfgZEs8A6I944NwyTe6G4/Y5Xn7nBVH7T5WMiyp0WC+K5mxdNrH1ViS2
         oFA2kC6W6SA5rxVuDY6IYkRW0a/TB37Z438uv1WyZoMYOcMd5GE8n9BLFVtCLVSbTD2i
         fcIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=YAGafpKWlTBR5z7xtPZCtG1bD5UHiFNT7IoDod/KXlQ=;
        b=IND9Vck3XtMw7ndl57AZFLeVXneoLXC3H4fjhY50CwHIHjjsDTTl8rsTKXCkpzlHVw
         5VYiZi6gsp9iWcJQYvxXeZ4EKtnu8gQaozQHu8tVSEVooNq3dm0UdObhBNtk6wyH8ZQV
         I4WwXLehZtNDSEbj7COA0OyxSTXfhDag1cnDRYZW/aLsjXh0s5sArY3cTdH+5gH4GGY3
         lAJBiAfPBbXWq32M7hKNMfLKduDWvigFKI4qfzuRGFDMc1963yzzBzu/s6E6TwTrtX1c
         mrNa4yWOvGUaMUQ3XDcKoFvzPIIpxDBl1SFoOItd8kVoo09xXJFnE8EoFrlQJHe7GTog
         +MeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15si2210184edb.167.2019.05.20.10.44.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 10:44:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39472 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSmKj-0001Fq-3l
	for alex.bennee@linaro.org; Mon, 20 May 2019 13:44:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59618)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hSm2N-0002Z6-JC
	for qemu-arm@nongnu.org; Mon, 20 May 2019 13:25:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hSm2M-00063x-4l
	for qemu-arm@nongnu.org; Mon, 20 May 2019 13:25:23 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33992)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hSm2L-00062v-VH
	for qemu-arm@nongnu.org; Mon, 20 May 2019 13:25:22 -0400
Received: by mail-wr1-f67.google.com with SMTP id f8so9127299wrt.1
	for <qemu-arm@nongnu.org>; Mon, 20 May 2019 10:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YAGafpKWlTBR5z7xtPZCtG1bD5UHiFNT7IoDod/KXlQ=;
	b=PFbryGVSMXQRnwm8Y6TGpkJEqKzT41ku3UHhaab//TmFVTA6+evHQprDOzPo2oxzS5
	7FVknl0yEljd2lJ6bfIEecRGcExE0aL5wuZoDJyy58DAhLmghMOn8qn+uRz4rqmAG8aP
	iWGLeyDZQBxb8qk3DtLlz6K/o7HNfv/B7JH1AcQzYn4HmbDulGXyafsfh06hNrzVssdv
	YsOfdpcTn2DrMPdjIA2nOUlyQZJPq5FiKzEW5kfTYp/ZoUoEBMx8dZeLXZoeXGNtrk7S
	HGu1/lhQqYXu3cUujF/JzPe+WAL24wTBT3iasEPwkjrjKtPOlI7E3cJIDWB3uYsQiA7/
	apuQ==
X-Gm-Message-State: APjAAAWGSBFtN2xs3DwxACGSTwjNFaRmn7jzu5YJxAVDYCLg96HMcNPg
	zQcwYLzizgqNV5hy5+BopPxizw==
X-Received: by 2002:a5d:6b50:: with SMTP id x16mr1833026wrw.220.1558373120421; 
	Mon, 20 May 2019 10:25:20 -0700 (PDT)
Received: from [192.168.1.43] (228.red-83-52-173.dynamicip.rima-tde.net.
	[83.52.173.228])
	by smtp.gmail.com with ESMTPSA id 67sm160459wmd.38.2019.05.20.10.25.19
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 10:25:19 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190520162809.2677-1-peter.maydell@linaro.org>
	<20190520162809.2677-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1d95fef3-b59d-69b2-5776-7494f74dbd0f@redhat.com>
Date: Mon, 20 May 2019 19:25:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520162809.2677-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/4] hw/intc/arm_gicv3: Fix
 write of ICH_VMCR_EL2.{VBPR0, VBPR1}
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +CQ7OzNC+dq7

On 5/20/19 6:28 PM, Peter Maydell wrote:
> In ich_vmcr_write() we enforce "writes of BPR fields to less than
> their minimum sets them to the minimum" by doing a "read vbpr and
> write it back" operation.  A typo here meant that we weren't handling
> writes to these fields correctly, because we were reading from VBPR0
> but writing to VBPR1.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/intc/arm_gicv3_cpuif.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index cbad6037f19..000bdbd6247 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -2366,7 +2366,7 @@ static void ich_vmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      /* Enforce "writing BPRs to less than minimum sets them to the minimum"
>       * by reading and writing back the fields.
>       */
> -    write_vbpr(cs, GICV3_G1, read_vbpr(cs, GICV3_G0));
> +    write_vbpr(cs, GICV3_G0, read_vbpr(cs, GICV3_G0));
>      write_vbpr(cs, GICV3_G1, read_vbpr(cs, GICV3_G1));
>  
>      gicv3_cpuif_virt_update(cs);
> 
