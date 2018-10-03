Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6118730wrt;
        Wed, 3 Oct 2018 03:18:34 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62ftm2HqhGhkHMFqI+1UCab7oJHGmfPOK8v7NUH/LJLUETxUzmIQovACh2qAG9vBFAQGd9a
X-Received: by 2002:a37:1a8b:: with SMTP id l11-v6mr513572qkh.197.1538561914609;
        Wed, 03 Oct 2018 03:18:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538561914; cv=none;
        d=google.com; s=arc-20160816;
        b=BwDhieZyLG0Jhm8VMYEPopFNuoDwjkf4RTUZrMtoHKPRuej8f7tqub2JMBr545Mvti
         V7OXs2YNpmx2q8KPzhXWF4xVX6+jTt1bVciWpAe/cKBezcEqVRqFFzXrzP/jPkXFdb+Q
         //YsX0MV2yZ3nkeVLIviiS4CVivCV86xjdJL0vJhar9CFadDGPB7u/peu2a3QYuVVKfh
         sgbh1aBSTgYPJcjhCsthoxQQygoURkebP9JNhnxinILOaCrnKsojxwh720tpPd0Q3Akx
         n8cadb8qJ1hgyUmyFbhNBp6Xv6JNxyDuOk+cWyj5VY8t4ZY7uG9lA4bZvV58hW8EHj9K
         ADFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=YGvyBWgcukmF04PSlYcYjbkHtqawrOudLSEraUI+SwA=;
        b=AXrmY6HtMvcxJkNjisAyui1/zXhsAyEptTLW5lJChQ+skktaBf0p/ZKxDh0ZutKxP+
         JWSqpqBUQbAPkKzNuKoPfKW0Qko/Ye1L9MDmnYBs08mV01S+63ICI7Uf5iHeuWIk/5UN
         Zo8UPlqvq1DzqaI4+iL2hpIIVoK3uX/Obbpn7pMDnxd8qAYZjAziIk5BFRAWgE5mgiu1
         vj9GX5nF+r73Mmbv/pNoYxZNpWl6L1QgXUvhTaUytUex/haW0WOE/8UJK7NeyeYNnn27
         xErp7kYYA+aY/vFzfd3NL41eNiYrGRctF+NhqLN+xwQRkMjElkBcFesqQFei+cEWF9BE
         bW5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e67-v6si547800qkd.399.2018.10.03.03.18.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 03:18:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47835 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7eEk-00048V-62
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 06:18:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7eEb-00047P-7K
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 06:18:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7eEX-0003qY-8a
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 06:18:24 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36727)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g7eEX-0003pn-1A
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 06:18:21 -0400
Received: by mail-wr1-f68.google.com with SMTP id y16so5477103wrw.3
	for <qemu-arm@nongnu.org>; Wed, 03 Oct 2018 03:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YGvyBWgcukmF04PSlYcYjbkHtqawrOudLSEraUI+SwA=;
	b=afdLFTh+C4SERlyaPJ0CRrP9fTd6qRQc/7kgq34j/oulOSBYhhBzJcUZ2w5SR86/21
	NqvzEFnM4WEpqK8XF60LAlWfD7BUVLu0pQVJZSLkJ78QLwR7Vb48dVcVT+I4ngVr07KF
	gQ3n6XG5m2ebpIuJJxCVlD94SAjCcPgalBZWmJhl5OW9WLz91WMyc5j82TD0TJlX2mZn
	nW6srFVd4eIssjYSTZgJJbPoQBkigpT3OPmLAKho1pOP9xiL4lfVOl1ouNNKI1YIRUSi
	fLtRf8r166um7E5kqjobU2t35tWGdv4oEHNergGensTZ2QGHI/9cxppo+7rE9YyBWpxV
	hKTA==
X-Gm-Message-State: ABuFfohAHjd/dinaaEM6755UdBdVD51IKaFSqYlsf7ZzZ291/ksaS49G
	W2UPzTTKgBpof3mNqomtlQKF/A==
X-Received: by 2002:adf:c806:: with SMTP id d6-v6mr730819wrh.243.1538561899058;
	Wed, 03 Oct 2018 03:18:19 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	y138-v6sm852561wmd.2.2018.10.03.03.18.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 03:18:18 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-14-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6516f5a5-449c-1d49-a4f0-241f49f16b61@redhat.com>
Date: Wed, 3 Oct 2018 12:18:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 13/13] target/arm: Add v8M stack
 checks for MSR to SP_NS
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
X-TUID: uXV+8EB4MoPG

On 02/10/2018 18:35, Peter Maydell wrote:
> Updating the NS stack pointer via MSR to SP_NS should include
> a check whether the new SP value is below the stack limit.
> No other kinds of update to the various stack pointer and
> limit registers via MSR should perform a check.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  target/arm/helper.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 074f7616272..712828674fa 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -10963,11 +10963,23 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
>               * currently in handler mode or not, using the NS CONTROL.SPSEL.
>               */
>              bool spsel = env->v7m.control[M_REG_NS] & R_V7M_CONTROL_SPSEL_MASK;
> +            bool is_psp = !arm_v7m_is_handler_mode(env) && spsel;
> +            uint32_t limit;
>  
>              if (!env->v7m.secure) {
>                  return;
>              }
> -            if (!arm_v7m_is_handler_mode(env) && spsel) {
> +
> +            limit = is_psp ? env->v7m.psplim[false] : env->v7m.msplim[false];
> +
> +            if (val < limit) {
> +                CPUState *cs = CPU(arm_env_get_cpu(env));
> +
> +                cpu_restore_state(cs, GETPC(), true);
> +                raise_exception(env, EXCP_STKOF, 0, 1);
> +            }
> +
> +            if (is_psp) {
>                  env->v7m.other_ss_psp = val;
>              } else {
>                  env->v7m.other_ss_msp = val;
> 
