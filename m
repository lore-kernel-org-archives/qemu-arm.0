Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp511621wrt;
        Wed, 26 Sep 2018 03:50:48 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60vNo8jfBGOjUx+QNcz7NqOFBs8t0SwbR4KlVW8o2HHiCnE7kfTEVrFhWbUIDFawxMHiM5m
X-Received: by 2002:ae9:e00c:: with SMTP id m12-v6mr3630240qkk.303.1537959048894;
        Wed, 26 Sep 2018 03:50:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537959048; cv=none;
        d=google.com; s=arc-20160816;
        b=AEvKKRbd8lgaQKWosY7cyMGry1e2ywY2ZlvLZifG4R/NRZlZ6qNgv6/UUpiDKzSr79
         Hc5lRYkMTGW0fWgFL1/n/m+4pakqo2gp4QhzbVzOF08CJL5aFKO+qvPGZtVE5ALmdcL/
         KRvRY60lv/AgF/1hBO2xOHXhBpIHjQUYHdoRiav08BcgddTjUv4Y3Bk2f0kwXZbur6EQ
         PnRtxCWXlWLLosqkH304l3NW7vjOC4aBBA5tM329UrCiF6jhUga6r4eZleSpOThSjp8z
         cTbw+wrLiwZSknVLfVjO8fvLswowmtvIND0t5vO/bWROCtGgsayGLsmKHkiJGi2RXbUm
         gXAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature;
        bh=LV9l9FmFJtfuZaj92KbZ1ybF9vbQYzHpWueQMV4jCWA=;
        b=yF+HOj9igyr0M5nqNGgq09OS2MWDq0a4mj29GJ+3QCF1w3ARDSq5/2U3s4x3xogVGx
         xFWxV2/WPPdMopg/kGwYaEPHici0ShBux5bfR3ROSPssT6d5LS0JB7tlXfatc1izsOwA
         C9Wu1VYOPN5xPYmKv2n3cPTiiQxf8mMG/1tPHGBqr6CT2+qXbtpS5TZr/EDLtI3MII6+
         U10VJ/NLfRIehZlJupi89sAkcgbgkLaacw2UVTCK5LfIwFzwMcpFsxj/DHAgEYknFbS8
         2S51KcxJLIaeriu5AcBapJWqd6hDuzOOIqt4Y4o4HvlEbPFCB+qnrcGXj5ed6CzCB3Kj
         me+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="mqUph/IU";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s187-v6si3883574qkb.15.2018.09.26.03.50.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Sep 2018 03:50:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="mqUph/IU";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57600 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g57P6-0005eS-81
	for alex.bennee@linaro.org; Wed, 26 Sep 2018 06:50:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g57NA-0004aY-06
	for qemu-devel@nongnu.org; Wed, 26 Sep 2018 06:48:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g57AM-0001ZZ-05
	for qemu-devel@nongnu.org; Wed, 26 Sep 2018 06:35:38 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:37818)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g57AL-0001Yy-Ll; Wed, 26 Sep 2018 06:35:33 -0400
Received: by mail-wr1-x443.google.com with SMTP id u12-v6so26417113wrr.4;
	Wed, 26 Sep 2018 03:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=LV9l9FmFJtfuZaj92KbZ1ybF9vbQYzHpWueQMV4jCWA=;
	b=mqUph/IUWeBfzBezVvALSle6WWCFF/MRWfvB0NIDxjNHuokPoGab5IVn3rGLWTg9LW
	Afl5bF0QIf2GtF4Vadq3uQRSiaH0WK6QMUO8mkjJ4HMtBaynaPnKncq1s3vB0c1nBATe
	Ck+oB9VH7wk/eYggdsCMp3z05oMTrp/EBnEgJB+TR78MUNlIIWaj4tHJI1SHr7xvxwc1
	lCKnnB+dJyPZL62ud3OYNbqLMoPnSsaUKmuVX27ouwMrmzokYj6IWckvABY+/soOWtwu
	JhAl+xzn7Mtawxh3lZJdXsExiRa1J56a9jFwu9kalsoslzqVbexkowkQYiBl8F2y8hLX
	Gkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=LV9l9FmFJtfuZaj92KbZ1ybF9vbQYzHpWueQMV4jCWA=;
	b=YtwXxWpc+XdFddDPcyjsJJsHGgq6RBi7ypri+jWx0uTb46llmg/CTfcRdbH6Ho14yw
	EuwpvTuHDrSUYNK8u2+Q0sTlnxJL2tuvmiG4zC096cuh+Yt6h19qxtoFqiSAPfblMvLZ
	8lFU7QbAg/Zg2jPuj+IahmFdynOdnMv52RSwo+r/EKtRvDx1W1NHzNg1JiHmpdZHZi6r
	GVxS1yj9gSu6RhK9/u2Mw2kJUVJbc7njz05LXJdugJGmSl3gcuYT1LCZ4Z565jUZUP8V
	jNNDmqVAb155syBBNXx46FVAV0rnfW1aLbWMgevE+WUMZhBIbg8+b2uGq2YLH88O5+9a
	ELNg==
X-Gm-Message-State: ABuFfohVF3i1OPNVEGSjQgeIMIHfxZPWpDnbcy4uCFsEKD6nA9C7S/LN
	T4NfFdu+8VwaxkOURS1G7mI=
X-Received: by 2002:adf:a599:: with SMTP id
	g25-v6mr4430799wrc.88.1537958132514; 
	Wed, 26 Sep 2018 03:35:32 -0700 (PDT)
Received: from [192.168.2.36] (106.red-88-7-90.staticip.rima-tde.net.
	[88.7.90.106]) by smtp.gmail.com with ESMTPSA id
	d4-v6sm4343599wrw.70.2018.09.26.03.35.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Sep 2018 03:35:31 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180925144127.31965-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBAgA/AhsPBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJbkphvBQkm
	loU1AAoJEOPjLCzercDeTLIP/3pzTBotxvkddIREaw2j/6RoxN1lj5hnCx/XHGF7QxAlO4uV
	7eB6hcZxAqlt4AyNX5jcsSxNMfVNGnZ+u4ni6VdRRLUOw/QPXKGV8siK2E1zOG1GwZSCJ5zb
	ol7gpXNnOG/+ZXDfvkfSNnpim0ahNIPX8WAaZ/qN7I1qsPGupK2JrlCot561TfIOT7KNZFAZ
	m66Hf8MeNr8HQtn+oDk6j7g6WuIYZiqvF1MladikIZXndDMCsopXsjOikMXtoVuC/df7BlwS
	UaM+DT47onbIfXOtsWQGd2dJhu07Kxphqlz1Uh3YA7IHsFzZkX+S9waPBEzC8YB39dkZKA2E
	XbObk/ZTtCBLb39KTN2L7bv3Agm6wYO/hw3DQJQV3/07vW1EJd4fglQB5IY2A3eQ/ZSuRVm1
	E1GyFszjLXKUQIKx1938zoLrUDDdWQH7bhhSvG7JWk1BKmJrIXDTDx1tvTOW2pYZuO1PNx+p
	EhJraVuu3jtSbEfH+uPeoWtJtqSRkz1fLqp+dbha24ldPeKw4ija/YTviOem5baUlf/iNgS+
	a0s0eoRiJFrGZFCKLGKgZYoJe1rccQR6JKKd8JpoaIQuzptcHZD4+qn8W8FUlkNWGfpTQrsN
	iPLZt2EFOFkbjoZ2EoEByCs9nZ8ro91+lq7QfH9RFcldKLZfPEWwHPrchQ42
Message-ID: <d890001e-6aef-673c-2727-b4278b85ca7f@amsat.org>
Date: Wed, 26 Sep 2018 12:35:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180925144127.31965-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] virt: Suppress external aborts
 on virt-2.10 and earlier
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
Cc: Idwer Vollering <idwer@cuckoo.sh>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2VyrNPCGUpft

Hi Peter,

On 9/25/18 4:41 PM, Peter Maydell wrote:
> In commit c79c0a314c43b78 we enabled emulation of external aborts
> when the guest attempts to access a physical address with no
> mapped device. In commit 4672cbd7bed88dc6 we suppress this for
> most legacy boards to prevent breakage of previously working
> guests, but we didn't suppress it in the 'virt' board, with
> the rationale "we know that guests won't try to prod devices
> that we don't describe in the device tree or ACPI tables". This
> is mostly true, but we've had a report of a Linux guest image
> that this did break. The problem seems to be that the guest
> is (incorrectly) configured with a DEBUG_UART_PHYS value that
> tells it there is a uart at 0x10009000 (which is true for
> vexpress but not for virt), so in early bootup the kernel
> probes this bogus address.
> 
> This is a misconfigured guest, so we don't need to worry
> about it too much, but we can arrange that guests that ran
> on QEMU v2.10 (before c79c0a314c43b78) will still run on
> the "virt-2.10" board model, by suppressing external aborts
> only for that version and earlier. This seems a reasonable
> compromise.

I tried another approach to keep MEMTX_DECODE_ERROR delivered (out of
0x10009000) for 2.10, using the UNIMP device, but the code looks uglier
(create too much generic code for a single issue):

-- >8 --

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 4cc57a7ef6..217c9de6f6 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -101,6 +101,7 @@ typedef struct {
     bool claim_edge_triggered_timers;
     bool smbios_old_sys_ver;
     bool no_highmem_ecam;
+    bool misconfigured_guest_debug_uart;
 } VirtMachineClass;

 typedef struct {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0b57f87abc..29bc9b9feb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -59,6 +59,7 @@
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
+#include "hw/misc/unimp.h"

 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -1532,6 +1533,10 @@ static void machvirt_init(MachineState *machine)
     fdt_add_pmu_nodes(vms);

     create_uart(vms, pic, VIRT_UART, sysmem, serial_hd(0));
+    if (vmc->misconfigured_guest_debug_uart) {
+        /* kludge ... */
+        create_unimplemented_device("phantom-pl011", 0x10009000, 0x1000);
+    }

     if (vms->secure) {
         create_secure_ram(vms, secure_sysmem);
@@ -1924,8 +1929,11 @@ static void virt_2_10_instance_init(Object *obj)

 static void virt_machine_2_10_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_2_11_options(mc);
     SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_10);
+    vmc->misconfigured_guest_debug_uart = true;
 }
 DEFINE_VIRT_MACHINE(2, 10)

-- 

I prefer your compromise.

> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/virt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 0b57f87abcb..3ba310a37b6 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1926,6 +1926,7 @@ static void virt_machine_2_10_options(MachineClass *mc)
>  {
>      virt_machine_2_11_options(mc);
>      SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_10);

Can you add a short comment here?

       /* See https://bugs.launchpad.net/qemu/+bug/???:
        * Some misconfigured Linux guest poke for vexpress uart
        * at 0x10009000 */

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +    mc->ignore_memory_transaction_failures = true;
>  }
>  DEFINE_VIRT_MACHINE(2, 10)
>  
