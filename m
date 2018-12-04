Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8141439wrt;
        Tue, 4 Dec 2018 06:35:41 -0800 (PST)
X-Google-Smtp-Source: AFSGD/W8kPnl9GIPxdJTHc/T8zmOw7ZDdW8/R0LhdvCqyeWp3WRrXZG/SzmZ1i4pF4ecHhRKmn2p
X-Received: by 2002:ac8:1add:: with SMTP id h29mr19165542qtk.258.1543934141011;
        Tue, 04 Dec 2018 06:35:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543934141; cv=none;
        d=google.com; s=arc-20160816;
        b=HsynnI85Hs1BS/3OZcWYivk7tukmVzbJN790KmpDp+mCNxIGncko3hXGoELSqAVlz9
         9wqGccc31MpvMkKwyxlnBVV0J1v7nEdhSAyCbuiGYGWoQ5M0Rnz1j4K72KbtIvAFpOgl
         VS3vZy1Z7mDmgcVK9SA7dl+K4FPatiC/7kUtLd/Oggg6Db3/1Q2rf7XAjmf4xmFBGtV3
         Jf2v8T8b81aeOBC+GEGvsQQcNs21psfgCfNwU4vCa8xlIvgltJfDdJa9cXR61JIeOx0K
         UBtK+LjG6KM8Dt/8xIb5cFZxLXgJgWWYjUKoF3+uBLDEA9ykxtfXUB3HqhzsqLlGwp+h
         UIFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=k8601QekDB+b4Agg9NiIDiMlEcTAoOGNMvMvHYfZSmM=;
        b=gXcJPDhG2VpMvjwJLuN00bBJuxweUtYYC+10YmmjBE7DzdcKiXEMTLDhjuPftPquat
         Q+6pIHno6vho3MmrTelM3wgCc9tMn77McUh9nRvTmTivqpHAeEoNGpRZdUnrfjNz/hGk
         BSYVfRVg2zCP1pUyrimdF0omFimBRHmf/ZmbFMa2OghPm7J0M8zdqx0SeCQXZ72bi1d2
         CbGdDu0/S557tVq6QlwLWWGoI9KaqLmP1o8uhhp9N6fctZSsM1H1oR/RDoACvVFTeygS
         rw+k3JbPk1UYTcefYrL4o28UE1wPNGzZZUDtejyYRNH5U3EiXDapb0vi/zDhp4upPxxp
         rh1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u7si1374114qkd.236.2018.12.04.06.35.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 06:35:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57131 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUBnY-00037O-Gb
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 09:35:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gUBe4-0000w5-0f
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 09:25:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gUBe0-0001Xf-0E
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 09:25:51 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39461)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gUBdx-0001Vp-Su
	for qemu-devel@nongnu.org; Tue, 04 Dec 2018 09:25:47 -0500
Received: by mail-wr1-f66.google.com with SMTP id t27so16167363wra.6
	for <qemu-devel@nongnu.org>; Tue, 04 Dec 2018 06:25:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=k8601QekDB+b4Agg9NiIDiMlEcTAoOGNMvMvHYfZSmM=;
	b=sveQRbz8C93dYdUlbS6F8H5XOCDti0nZIo0MtPx+Cp1tFX7/f+2VXPIHIgkQm7QXz0
	72leMPeZWRof44VKWEFweeHaNRvK4Am1EcuOPQZLwH+vsYIIdN3T/xjCVEaBhm5NS+P+
	BAWW9CkqO1w9hZey46wB2rAURigxg+bAcwgUiipGTQdW4iSTscYqNxYlorObRUfK3G3W
	6at/hoPWjJC5wv2NxTRktbjb49pbhcJ4r6AKAksMYAbyOJ4mxd0MSyicuYPSQxVG9Uui
	3U5BKQQ724/w5/BebP7EGQXe4pgdRPbP3iUW1xz/LnRhwcNza7D1w9bXO5TwZ4qqmTCZ
	L7HA==
X-Gm-Message-State: AA+aEWb4uBrfZ3+1tj88nfzcPdVd+dt0URBaM5Fj8Upe63vdVdTy3bDU
	+QiZovO2LGVedJPwUdScl6qAPw==
X-Received: by 2002:a5d:4a8e:: with SMTP id o14mr17566087wrq.159.1543933542085;
	Tue, 04 Dec 2018 06:25:42 -0800 (PST)
Received: from [10.0.0.124] ([185.102.219.36])
	by smtp.gmail.com with ESMTPSA id
	q2sm17956264wru.56.2018.12.04.06.25.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Dec 2018 06:25:40 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181204132952.2601-1-peter.maydell@linaro.org>
	<20181204132952.2601-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <3dafcb3b-ff92-07f7-dc71-04a5e0aa01c4@redhat.com>
Date: Tue, 4 Dec 2018 15:25:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181204132952.2601-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-devel] [PATCH 1/5] target/arm: Free name string in
 ARMCPRegInfo hashtable entries
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
X-TUID: mY3hjEIO6T6T

On 4/12/18 14:29, Peter Maydell wrote:
> When we add a new entry to the ARMCPRegInfo hash table in
> add_cpreg_to_hashtable(), we allocate memory for tehe

"for the"?

> ARMCPRegInfo struct itself, and we also g_strdup() the
> name string. So the hashtable's value destructor function
> must free the name string as well as the struct.
> 
> Spotted by clang's leak sanitizer. The leak here is a
> small one-off leak at startup, because we don't support
> CPU hotplug, and so the only time when we destroy
> hash table entries is for the case where ARM_CP_OVERRIDE
> means we register a wildcard entry and then override it later.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  target/arm/cpu.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 60411f6bfe0..b84a6c0e678 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -642,6 +642,20 @@ uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz)
>      return (Aff1 << ARM_AFF1_SHIFT) | Aff0;
>  }
>  
> +static void cpreg_hashtable_data_destroy(gpointer data)
> +{
> +    /*
> +     * Destroy function for cpu->cp_regs hashtable data entries.
> +     * We must free the name string because it was g_strdup()ed in
> +     * add_cpreg_to_hashtable(). It's OK to cast away the 'const'
> +     * from r->name because we know we definitely allocated it.
> +     */
> +    ARMCPRegInfo *r = data;
> +
> +    g_free((void *)r->name);
> +    g_free(r);
> +}
> +
>  static void arm_cpu_initfn(Object *obj)
>  {
>      CPUState *cs = CPU(obj);
> @@ -649,7 +663,7 @@ static void arm_cpu_initfn(Object *obj)
>  
>      cs->env_ptr = &cpu->env;
>      cpu->cp_regs = g_hash_table_new_full(g_int_hash, g_int_equal,
> -                                         g_free, g_free);
> +                                         g_free, cpreg_hashtable_data_destroy);
>  
>      QLIST_INIT(&cpu->pre_el_change_hooks);
>      QLIST_INIT(&cpu->el_change_hooks);
> 
