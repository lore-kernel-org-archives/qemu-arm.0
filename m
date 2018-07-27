Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp661817wru;
        Fri, 27 Jul 2018 05:45:33 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdqHtzRuXs+xMMqwoHvi9fBnkluUvDGQoMdsy1XfIpE03EIkr4AunuF3zeuCVeLjZqUthtf
X-Received: by 2002:ac8:5289:: with SMTP id s9-v6mr5685479qtn.311.1532695533274;
        Fri, 27 Jul 2018 05:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532695533; cv=none;
        d=google.com; s=arc-20160816;
        b=gS9gYUzWPb5Sx5Uy0EvklCmMLz03ayWUpGxvzYTe8Dy6ufbzBIeD7j/z8kzCzDrSY4
         6gcX/v3qxxrkqX/buo7GCDe4pJlUnR5vDlAP0DZ2zly2UdfLp0cfTjH27Y5U1dG+OWt7
         2a9dCeWeRA4yJygiL8o+t/yrtATlcfqcwgyeHCARUuTW2yO/0GkQ/20ZVCaLSqVwQweD
         LdLfC9hR389w0HQuNUMHJcaM7i2axhhzavw9JW0468myx2YTe5cu+oy6CjAK5b5MPssN
         65yUhUuYfz81Cz8TfGRbu0rCHKa+fMGRyEOe7UQPnEPC8ETI8/fWLoVP40PRnCvPUJvT
         0NcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=wJAj/MjryNQ6C554cQgiiEpuZUgElCcc4NmdFHx8yOI=;
        b=EXTihdWwW1Z11ll/4jhZzksaZimVAdd02sWtpqPG3Pdga5J/N5yFGs40+y9Fws2vdk
         qdcD73zm2kOy40sK4yyRzAFAHgWjHVJZGxQY/8K/0fg/MKBg+u2tS8cP/G5sk9SGIpUr
         n89zSgKtCATcKY3B1hYsTNJ2neKqYkd738gE5YHdTlOTxdSmtqg2DNGqqutYUYPOoTCe
         Z5KEKS5Qkc5WPXJNUmNqFEFNfiarWg0dcAVl2eCxIWfLwbs75Xqb1C5YuIP1W7vhI06S
         KyOw/qk2RoWw+U41txQw7Pg7l/wbPpv23y4Nja8pmUuslTOS1FaNtjHYT2FR719GXZox
         ltQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PQ5VVwfL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r3-v6si849472qtb.236.2018.07.27.05.45.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 05:45:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PQ5VVwfL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fj27g-0006d9-SB
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 08:45:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj27Y-0006ZD-Bu
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 08:45:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj27W-0002O2-Cu
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 08:45:24 -0400
Received: from mail-vk0-x244.google.com ([2607:f8b0:400c:c05::244]:45217)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fj27W-0002Ni-3k; Fri, 27 Jul 2018 08:45:22 -0400
Received: by mail-vk0-x244.google.com with SMTP id b78-v6so2375100vka.12;
	Fri, 27 Jul 2018 05:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wJAj/MjryNQ6C554cQgiiEpuZUgElCcc4NmdFHx8yOI=;
	b=PQ5VVwfLNy8365BZe4NSO8ulVyaQ4EOt5TieWCQBMD0uIt+Iir4kDoiIg19I1MJ6rs
	gXNzqFvah3C5YcUs8/fWnbVOrMa/WkKlbAJkN5fgyytMYpjw+0fxMstxFYGGin61e092
	v0WvSpOn4GQwaQH5RPS33XhJEhGv9LIJfEcUomAYBydD57wSuan17K/Jf8Q48JwxS75J
	EAkmqtefoxzDsTe+mc1DnXF7hB/c8G7Zof41UKQJ3N635org0T5i9K0cIXIsJ97VMSLd
	4R+hYV1ITQ/66mq9kd4RnvSJPjevKfc/0VWSXCTyTwgPOVN73JRsAD2xI2riaaBaAF0z
	OBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=wJAj/MjryNQ6C554cQgiiEpuZUgElCcc4NmdFHx8yOI=;
	b=UPfbmYTIpOc7t3dMpCUIR9Ol7MV7BVygnnifO1ReOR137ddp0O1um3VIHQyZ+fPA4v
	JBjzG8nt66gXCm8cuGTZsNHmZuBs46R4uRr37FYJx1B5gTzWKdy5yYjsiOxZsqO1psUE
	jx8aHFlOXyEQ+IP9Uvs6byJc7yRYqIDZDEnW2zvoYfXNYDFsIS+jKLIv/IV4CPhB/cTO
	E8e7Vv7hFOFGMXUej7Gl4c1DpokgQ7GWnHZYiItSH1DCDHlpmOUNp35hPkU1qBwY0v0x
	OldaGtMGUwVfbEUBIKiiuDGMrj+M/bWPGaD/PLLrJGGAsamY6+Vs7lkDFyJ+VrHjIfeN
	7Osg==
X-Gm-Message-State: AOUpUlHsG6m76188JL5YXgbm31jzCXk6iXkOCly0qn/vMFb0QN9Y78cO
	AAZRBqH+r3CHeZVlNIaTF6o=
X-Received: by 2002:a1f:8649:: with SMTP id
	i70-v6mr3752771vkd.29.1532695521281; 
	Fri, 27 Jul 2018 05:45:21 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	g41-v6sm938956uah.31.2018.07.27.05.45.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 05:45:20 -0700 (PDT)
To: Luc Michel <luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
	<20180727095421.386-9-luc.michel@greensocs.com>
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
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <03210035-38cb-8d83-fb27-72c9acee36e2@amsat.org>
Date: Fri, 27 Jul 2018 09:45:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180727095421.386-9-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::244
Subject: Re: [Qemu-arm] [PATCH v5 08/20] intc/arm_gic: Refactor secure/ns
 access check in the CPU interface
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	qemu-devel@nongnu.org, saipava@xilinx.com, edgari@xilinx.com,
	qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bpib4vsxXSoW

On 07/27/2018 06:54 AM, Luc Michel wrote:
> An access to the CPU interface is non-secure if the current GIC instance
> implements the security extensions, and the memory access is actually
> non-secure. Until then, it was checked with tests such as
>   if (s->security_extn && !attrs.secure) { ... }
> in various places of the CPU interface code.
> 
> With the implementation of the virtualization extensions, those tests
> must be updated to take into account whether we are in a vCPU interface
> or not. This is because the exposed vCPU interface does not implement
> security extensions.
> 
> This commits replaces all those tests with a call to the
> gic_cpu_ns_access() function to check if the current access to the CPU
> interface is non-secure. This function takes into account whether the
> current CPU is a vCPU or not.
> 
> Note that this function is used only in the (v)CPU interface code path.
> The distributor code path is left unchanged, as the distributor is not
> exposed to vCPUs at all.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gic.c | 39 ++++++++++++++++++++++-----------------
>  1 file changed, 22 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 41141fee53..94d5982e2a 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -72,10 +72,15 @@ static inline int gic_get_current_vcpu(GICState *s)
>  static inline bool gic_has_groups(GICState *s)
>  {
>      return s->revision == 2 || s->security_extn;
>  }
>  
> +static inline bool gic_cpu_ns_access(GICState *s, int cpu, MemTxAttrs attrs)
> +{
> +    return !gic_is_vcpu(cpu) && s->security_extn && !attrs.secure;
> +}
> +
>  /* TODO: Many places that call this routine could be optimized.  */
>  /* Update interrupt status after enabled or pending bits have been changed.  */
>  static void gic_update(GICState *s)
>  {
>      int best_irq;
> @@ -219,11 +224,11 @@ static uint16_t gic_get_current_pending_irq(GICState *s, int cpu,
>      if (pending_irq < GIC_MAXIRQ && gic_has_groups(s)) {
>          int group = GIC_DIST_TEST_GROUP(pending_irq, (1 << cpu));
>          /* On a GIC without the security extensions, reading this register
>           * behaves in the same way as a secure access to a GIC with them.
>           */
> -        bool secure = !s->security_extn || attrs.secure;
> +        bool secure = !gic_cpu_ns_access(s, cpu, attrs);
>  
>          if (group == 0 && !secure) {
>              /* Group0 interrupts hidden from Non-secure access */
>              return 1023;
>          }
> @@ -426,11 +431,11 @@ static uint32_t gic_dist_get_priority(GICState *s, int cpu, int irq,
>  }
>  
>  static void gic_set_priority_mask(GICState *s, int cpu, uint8_t pmask,
>                                    MemTxAttrs attrs)
>  {
> -    if (s->security_extn && !attrs.secure) {
> +    if (gic_cpu_ns_access(s, cpu, attrs)) {
>          if (s->priority_mask[cpu] & 0x80) {
>              /* Priority Mask in upper half */
>              pmask = 0x80 | (pmask >> 1);
>          } else {
>              /* Non-secure write ignored if priority mask is in lower half */
> @@ -442,11 +447,11 @@ static void gic_set_priority_mask(GICState *s, int cpu, uint8_t pmask,
>  
>  static uint32_t gic_get_priority_mask(GICState *s, int cpu, MemTxAttrs attrs)
>  {
>      uint32_t pmask = s->priority_mask[cpu];
>  
> -    if (s->security_extn && !attrs.secure) {
> +    if (gic_cpu_ns_access(s, cpu, attrs)) {
>          if (pmask & 0x80) {
>              /* Priority Mask in upper half, return Non-secure view */
>              pmask = (pmask << 1) & 0xff;
>          } else {
>              /* Priority Mask in lower half, RAZ */
> @@ -458,11 +463,11 @@ static uint32_t gic_get_priority_mask(GICState *s, int cpu, MemTxAttrs attrs)
>  
>  static uint32_t gic_get_cpu_control(GICState *s, int cpu, MemTxAttrs attrs)
>  {
>      uint32_t ret = s->cpu_ctlr[cpu];
>  
> -    if (s->security_extn && !attrs.secure) {
> +    if (gic_cpu_ns_access(s, cpu, attrs)) {
>          /* Construct the NS banked view of GICC_CTLR from the correct
>           * bits of the S banked view. We don't need to move the bypass
>           * control bits because we don't implement that (IMPDEF) part
>           * of the GIC architecture.
>           */
> @@ -474,11 +479,11 @@ static uint32_t gic_get_cpu_control(GICState *s, int cpu, MemTxAttrs attrs)
>  static void gic_set_cpu_control(GICState *s, int cpu, uint32_t value,
>                                  MemTxAttrs attrs)
>  {
>      uint32_t mask;
>  
> -    if (s->security_extn && !attrs.secure) {
> +    if (gic_cpu_ns_access(s, cpu, attrs)) {
>          /* The NS view can only write certain bits in the register;
>           * the rest are unchanged
>           */
>          mask = GICC_CTLR_EN_GRP1;
>          if (s->revision == 2) {
> @@ -505,11 +510,11 @@ static uint8_t gic_get_running_priority(GICState *s, int cpu, MemTxAttrs attrs)
>      if ((s->revision != REV_11MPCORE) && (s->running_priority[cpu] > 0xff)) {
>          /* Idle priority */
>          return 0xff;
>      }
>  
> -    if (s->security_extn && !attrs.secure) {
> +    if (gic_cpu_ns_access(s, cpu, attrs)) {
>          if (s->running_priority[cpu] & 0x80) {
>              /* Running priority in upper half of range: return the Non-secure
>               * view of the priority.
>               */
>              return s->running_priority[cpu] << 1;
> @@ -529,11 +534,11 @@ static bool gic_eoi_split(GICState *s, int cpu, MemTxAttrs attrs)
>  {
>      if (s->revision != 2) {
>          /* Before GICv2 prio-drop and deactivate are not separable */
>          return false;
>      }
> -    if (s->security_extn && !attrs.secure) {
> +    if (gic_cpu_ns_access(s, cpu, attrs)) {
>          return s->cpu_ctlr[cpu] & GICC_CTLR_EOIMODE_NS;
>      }
>      return s->cpu_ctlr[cpu] & GICC_CTLR_EOIMODE;
>  }
>  
> @@ -561,11 +566,11 @@ static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "gic_deactivate_irq: GICC_DIR write when EOIMode clear");
>          return;
>      }
>  
> -    if (s->security_extn && !attrs.secure && !group) {
> +    if (gic_cpu_ns_access(s, cpu, attrs) && !group) {
>          DPRINTF("Non-secure DI for Group0 interrupt %d ignored\n", irq);
>          return;
>      }
>  
>      GIC_DIST_CLEAR_ACTIVE(irq, cm);
> @@ -603,11 +608,11 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>          }
>      }
>  
>      group = gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, cm);
>  
> -    if (s->security_extn && !attrs.secure && !group) {
> +    if (gic_cpu_ns_access(s, cpu, attrs) && !group) {
>          DPRINTF("Non-secure EOI for Group0 interrupt %d ignored\n", irq);
>          return;
>      }
>  
>      /* Secure EOI with GICC_CTLR.AckCtl == 0 when the IRQ is a Group 1
> @@ -1279,11 +1284,11 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
>          break;
>      case 0x04: /* Priority mask */
>          *data = gic_get_priority_mask(s, cpu, attrs);
>          break;
>      case 0x08: /* Binary Point */
> -        if (s->security_extn && !attrs.secure) {
> +        if (gic_cpu_ns_access(s, cpu, attrs)) {
>              if (s->cpu_ctlr[cpu] & GICC_CTLR_CBPR) {
>                  /* NS view of BPR when CBPR is 1 */
>                  *data = MIN(s->bpr[cpu] + 1, 7);
>              } else {
>                  /* BPR is banked. Non-secure copy stored in ABPR. */
> @@ -1306,11 +1311,11 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
>          /* GIC v2, no security: ABPR
>           * GIC v1, no security: not implemented (RAZ/WI)
>           * With security extensions, secure access: ABPR (alias of NS BPR)
>           * With security extensions, nonsecure access: RAZ/WI
>           */
> -        if (!gic_has_groups(s) || (s->security_extn && !attrs.secure)) {
> +        if (!gic_has_groups(s) || (gic_cpu_ns_access(s, cpu, attrs))) {

Superfluous parenthesis,

>              *data = 0;
>          } else {
>              *data = s->abpr[cpu];
>          }
>          break;
> @@ -1318,11 +1323,11 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
>      {
>          int regno = (offset - 0xd0) / 4;
>  
>          if (regno >= GIC_NR_APRS || s->revision != 2) {
>              *data = 0;
> -        } else if (s->security_extn && !attrs.secure) {
> +        } else if (gic_cpu_ns_access(s, cpu, attrs)) {
>              /* NS view of GICC_APR<n> is the top half of GIC_NSAPR<n> */
>              *data = gic_apr_ns_view(s, regno, cpu);
>          } else {
>              *data = s->apr[regno][cpu];
>          }
> @@ -1331,11 +1336,11 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
>      case 0xe0: case 0xe4: case 0xe8: case 0xec:
>      {
>          int regno = (offset - 0xe0) / 4;
>  
>          if (regno >= GIC_NR_APRS || s->revision != 2 || !gic_has_groups(s) ||
> -            (s->security_extn && !attrs.secure)) {
> +            gic_cpu_ns_access(s, cpu, attrs)) {
>              *data = 0;
>          } else {
>              *data = s->nsapr[regno][cpu];
>          }
>          break;
> @@ -1358,11 +1363,11 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
>          break;
>      case 0x04: /* Priority mask */
>          gic_set_priority_mask(s, cpu, value, attrs);
>          break;
>      case 0x08: /* Binary Point */
> -        if (s->security_extn && !attrs.secure) {
> +        if (gic_cpu_ns_access(s, cpu, attrs)) {
>              if (s->cpu_ctlr[cpu] & GICC_CTLR_CBPR) {
>                  /* WI when CBPR is 1 */
>                  return MEMTX_OK;
>              } else {
>                  s->abpr[cpu] = MAX(value & 0x7, GIC_MIN_ABPR);
> @@ -1373,11 +1378,11 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
>          break;
>      case 0x10: /* End Of Interrupt */
>          gic_complete_irq(s, cpu, value & 0x3ff, attrs);
>          return MEMTX_OK;
>      case 0x1c: /* Aliased Binary Point */
> -        if (!gic_has_groups(s) || (s->security_extn && !attrs.secure)) {
> +        if (!gic_has_groups(s) || (gic_cpu_ns_access(s, cpu, attrs))) {

Ditto,

>              /* unimplemented, or NS access: RAZ/WI */
>              return MEMTX_OK;
>          } else {
>              s->abpr[cpu] = MAX(value & 0x7, GIC_MIN_ABPR);
>          }
> @@ -1387,11 +1392,11 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
>          int regno = (offset - 0xd0) / 4;
>  
>          if (regno >= GIC_NR_APRS || s->revision != 2) {
>              return MEMTX_OK;
>          }
> -        if (s->security_extn && !attrs.secure) {
> +        if (gic_cpu_ns_access(s, cpu, attrs)) {
>              /* NS view of GICC_APR<n> is the top half of GIC_NSAPR<n> */
>              gic_apr_write_ns_view(s, regno, cpu, value);
>          } else {
>              s->apr[regno][cpu] = value;
>          }
> @@ -1402,11 +1407,11 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
>          int regno = (offset - 0xe0) / 4;
>  
>          if (regno >= GIC_NR_APRS || s->revision != 2) {
>              return MEMTX_OK;
>          }
> -        if (!gic_has_groups(s) || (s->security_extn && !attrs.secure)) {
> +        if (!gic_has_groups(s) || (gic_cpu_ns_access(s, cpu, attrs))) {

Ditto.

>              return MEMTX_OK;
>          }
>          s->nsapr[regno][cpu] = value;
>          break;
>      }
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
