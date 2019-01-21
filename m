Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6440985wrt;
        Mon, 21 Jan 2019 12:12:47 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6KegAX2JtW8dK+8bt8athTQq3xCqlv3u/nTtfXfZ84A6oMMpzNotuiFB9W7UKVSvC8CIwM
X-Received: by 2002:adf:f3c6:: with SMTP id g6mr29097729wrp.111.1548101567693;
        Mon, 21 Jan 2019 12:12:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548101567; cv=none;
        d=google.com; s=arc-20160816;
        b=vSgQQ8/q09sfINoiF2nKX61CPlgQYv28nhZPfxzMd7/hrIdZSGETS/G8ynLys9dtYf
         inJ3lSQGD9CJDAWKV0jWSW70QVDsBy/KlUgxC6cuHLIY2p/ZcNm64+MNZovWm9KRo0nH
         CmACuCQDnxnW75/OrzwP8oF+P25/sdI6yVe0iaG0iYO2ipaV76zqv0uLQGoDnKt/1LTc
         ItKM6VvKF+TaAyns7fsK8mpZdEIBycYhyJQjrebZG8Xyw3Y4ubdNJQHxbGjKJOpUVOc2
         rmXcZe+BOQ8NGADUzlhai8YN+62guB9ljJgUYOepPSwfg0KCqtsHZ/1zve/Epf7CSumi
         V5RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=HPJnloVTTWU6bmxOjdoYUWrUI/NQFYcwt0Ezd5oXO4E=;
        b=po6q+DsPVqTIYAv0F/6EKbzUd8GZ55LI/WVrDYu7LsITT9d8Rkp8t5c+P0hER9kwxn
         63fvqDiZx7zOUbFQ4mN2BmM7qmRJ9yW+msAcVytyEttyQ0JFgUbIkGTNpRKmurglrX/F
         ci8oLeXdK5G6b6WmMoSlCU6Rr4hYGrkT7obCgLkMcjeyjD8/y0m764mj0ZsfqOHwb8B7
         bwXK+enZu6FquM3fkgIBnKTiN5aSK0JPpnw1u3rJyTGwAszMbPaSjSotk/xIMw75j9xR
         HOdZD+yhqi/04EXoFncMzidl26CqdL+iFsNd56QY5EwhybXZr89n7oEhTzVQIuqbHIoF
         SHdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6si26897830wrg.298.2019.01.21.12.12.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 12:12:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59288 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glfw6-00071H-PU
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 15:12:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1glfvx-00070J-TN
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 15:12:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1glfvw-0005UW-VZ
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 15:12:37 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43667)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1glfvw-0005U6-Np
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 15:12:36 -0500
Received: by mail-wr1-f66.google.com with SMTP id r10so24795689wrs.10
	for <qemu-arm@nongnu.org>; Mon, 21 Jan 2019 12:12:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=HPJnloVTTWU6bmxOjdoYUWrUI/NQFYcwt0Ezd5oXO4E=;
	b=uCJxfwa7VCdSHZmeYATp6LoGMGiKuK7+Tm3t1rnJDZDPBNJYwkOJzWI2Pz7OOYfCPU
	DEPUiItfmzFFfSwkux2wG0+REHGEI9WoJdysLUcafOVoFbQ2535jbapY98tXSnZxyaQW
	sebj95eLXs1W5d7DZMOBjHMiVfQAkkoTCjC7R6Ex6+xfQuznYzlx2mdku9HlWpVjdpQW
	/ygLTtic+BaXWtHx/XbnrmmFWWa01IVsJ8QmvWjHbjiLH1X7GkPghaiCyrrTfYNydQvZ
	WFTn8NmlAZ/9GTkKNr0Tepa6S/+moCTpBK6Ic69DZzAaPLqdxW0msXc0xOlaN3WM15Ob
	UrMw==
X-Gm-Message-State: AJcUukfQLsNiaiEWYFLCzWcRIAHb2L2mFju0F17aZBEMBif7W4SK5h8k
	aIK7RHLamED59bgPLfQEQIcZ+A==
X-Received: by 2002:adf:be0f:: with SMTP id n15mr30513270wrh.267.1548101555238;
	Mon, 21 Jan 2019 12:12:35 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	s132sm32809893wmf.28.2019.01.21.12.12.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jan 2019 12:12:34 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
References: <20190121184314.14311-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <383fd07d-9c2a-a7b2-5b88-f9a411c8b91a@redhat.com>
Date: Mon, 21 Jan 2019 21:12:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121184314.14311-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] xlnx-zynqmp: Don't create
 rpu-cluster if there are no RPUs
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
Cc: qemu-devel@nongnu.org, Luc Michel <luc.michel@greensocs.com>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dx2fAXSgoc+j

Hi Peter,

On 1/21/19 7:43 PM, Peter Maydell wrote:
> If we aren't going to create any RPUs, then don't create the
> rpu-cluster unit. This allows us to add an assertion to the
> cluster object that it contains at least one CPU, which helps
> to avoid bugs in creating clusters and putting CPUs in them.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is a preparatory patch that is necessary for the series
> "[PATCH v3 0/4] tcg: support heterogenous CPU clusters"
> (20190121152218.9592-1-peter.maydell@linaro.org)
> in order to avoid the xlnx-zcu102 board asserting if started with
> fewer than 5 CPUs.
> 
>  hw/arm/xlnx-zynqmp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 370b0e44a38..16cba433cb7 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -178,6 +178,11 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
>      int i;
>      int num_rpus = MIN(smp_cpus - XLNX_ZYNQMP_NUM_APU_CPUS, XLNX_ZYNQMP_NUM_RPU_CPUS);

Not related to this patch, but this check seems dangerous, i.e. using
"-smp 2" we get num_rpus=-2 which luckyly doesn't enter the for() loop.

>  
> +    if (num_rpus == 0) {

With the current codebase, you'd have to check for "num_rpus <= 0", ...

> +        /* Don't create rpu-cluster object if there's nothing to put in it */
> +        return;
> +    }
> +
>      object_initialize_child(OBJECT(s), "rpu-cluster", &s->rpu_cluster,
>                              sizeof(s->rpu_cluster), TYPE_CPU_CLUSTER,
>                              &error_abort, NULL);
> 

... because the rpu cluster is still created:

aarch64-softmmu/qemu-system-aarch64 -M xlnx-zcu102 -smp 2 -S -monitor stdio

(qemu) info qom-tree
/machine (xlnx-zcu102-machine)
  /peripheral (container)
  /soc (xlnx,zynqmp)
    /rpu-cluster (cpu-cluster)
    /apu-cluster (cpu-cluster)
      /apu-cpu[1] (cortex-a53-arm-cpu)
        /unnamed-gpio-in[1] (irq)
        /unnamed-gpio-in[3] (irq)
        /unnamed-gpio-in[2] (irq)
        /unnamed-gpio-in[0] (irq)
      /apu-cpu[0] (cortex-a53-arm-cpu)
        /unnamed-gpio-in[1] (irq)
        /unnamed-gpio-in[3] (irq)
        /unnamed-gpio-in[2] (irq)
        /unnamed-gpio-in[0] (irq)


What about this instead?

-- >8 --
@@ -451,10 +451,12 @@ static void xlnx_zynqmp_realize(DeviceState *dev,
Error **errp)
                     "RPUs just use -smp 6.");
     }

-    xlnx_zynqmp_create_rpu(s, boot_cpu, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
+    if (smp_cpus > XLNX_ZYNQMP_NUM_APU_CPUS) {
+        xlnx_zynqmp_create_rpu(s, boot_cpu, &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
     }

     if (!s->boot_cpu_ptr) {
---

Regards,

Phil.
