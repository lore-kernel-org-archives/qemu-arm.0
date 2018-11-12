Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2989493wrw;
        Mon, 12 Nov 2018 03:10:25 -0800 (PST)
X-Google-Smtp-Source: AJdET5cW7OXbvXnAn/u7eZKfJYlCzQaJeiB1ka/+KqiFVsyi5fc9QjBS6YAMg8hhz9p+7tQmQc0V
X-Received: by 2002:aed:3511:: with SMTP id a17mr414015qte.153.1542021025534;
        Mon, 12 Nov 2018 03:10:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542021025; cv=none;
        d=google.com; s=arc-20160816;
        b=XNE2Rd/QDGKVQnk4S2fYSvI8xQcEJYTeo878/B593vrJv42eTlglInBsj+os3l3Qvz
         +zNLz9P43GEqfDiH8sCRF1WaH3MKlyfr0uCsOfe75bQ04A/zxOWhxRexjiz6WF+/2UkI
         luwvqNxw/x7mA7PCsjEK8mkgF2E9WDtFCMQmY/QSJj4RTjK0kpexJwkh1ODnKf+CVn55
         lxyI8j/DnDgZoml1cgpzQ4d6Pfkb6ajIeSF3qny/hEebPEP6A5oCC+49fPm2bqwUCoTN
         CDs6PUCPzGKlv8Z18lMelhWOeKFGCkivkwCTOhyFH9j+1ybuVaLp6E7l6HuCD7G4Lr0E
         AAzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=qN4iG1BxN7sA30PfGvbjLyE+i8Qgp3z6XL/nXFC4Fk4=;
        b=slAiGLjIXPVBgELEbpatcuwv3LIqlHJQPTAz4NDx5/ktinGtzRKhk7wVSDWy+vflTT
         JPp4xRBe9EF8vQPYo5vdTTe3duNJ18uDJsViQuZfQO0H82bJ6OCAtHAZI1Pj+zU9Rb43
         dcSWig0fqmk7JGi1vC5KboCOZmSmJfDz/CDedHJwZpuiI4hp8DAP5eykx0HZisQbbGvz
         z0rs0CmA9+jL6zSY7nyDTEieD8xMRgNg90MKIDyTlTe5vNtTj6ZJn3GhtbG9+VZ30E/L
         djklAwru9MvU1CTdY30fgpdxZgecup2hXXkC7jWx6LaWVz015ygYILJzPEiZ1pc8nxE+
         Rg9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f07lZYK5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c22si2246955qtb.13.2018.11.12.03.10.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Nov 2018 03:10:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f07lZYK5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47853 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMA6r-0004Qp-0T
	for alex.bennee@linaro.org; Mon, 12 Nov 2018 06:10:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gMA6h-0004Q9-30
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 06:10:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gMA6c-0003ei-MJ
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 06:10:15 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:33512)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gMA6c-0003cI-CE; Mon, 12 Nov 2018 06:10:10 -0500
Received: by mail-lj1-x243.google.com with SMTP id v1-v6so7242376ljd.0;
	Mon, 12 Nov 2018 03:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qN4iG1BxN7sA30PfGvbjLyE+i8Qgp3z6XL/nXFC4Fk4=;
	b=f07lZYK5Ab97SS/rtmjmyeCOMy/eTiy+ZHb2DCDmuGACZaHlJlCrmsRzVdav1NWjTc
	ZEyeC4JpdBAunRSRImjqDPKZlzYwieaE/nfsnmqfYF3nmr2ebAVMQD6LmRxyPXJOefBH
	gClts8h7gQuP12jj3c4I6rmIXXHjQYbQYi4FE4k5nd81IZzKxmkv2+YYwjPbKPcOIOpW
	JJIJhTIr54HpOuCE71wRbfpW72ph0UuqnIDc58+eBnEnNRklrWchEsxclNUWGKJRwsh9
	SaFpQMYZqa3D5FSE+ta8xSMRcrFF7Z41CCYL5Xiar6FPFhemtQ5rH1CTiZDq+Bo/XA9T
	j+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qN4iG1BxN7sA30PfGvbjLyE+i8Qgp3z6XL/nXFC4Fk4=;
	b=QQat8uIISXeaR7algPn0frcOeyEcv3rs72rCQYZkmqFpmWZNRfruV5k4lps7fXe1iU
	sZpNkM67Yzh6Ht97bylA9pBxvTWBMM331kksz9BK2mZdJzGpUALDQeWapMP+uHw0kYbR
	ofKolFV9bKBC9P1CBGOXHoqIZtLiTA8svpa1kESDDqnfb+876cqoA7+y0d2rFubQbYpf
	wyRsrB4qlkv3kU/SqnD+x8g2xinYSuYxfICKcZo3aBkOfIUQVpiMDfhUOQNcQoyYySJH
	/eg2ebZLVHQm43+fMdMMAHlIfsgb3JzjjQrmBYgY+dSsMVPDlOZP+GwpoDCz89R+4l3w
	2xzg==
X-Gm-Message-State: AGRZ1gLbIeOZZA7XNkYzDMkPo706hHmqFPHsxNTy1SQlxiSBC0isDrmZ
	5JTDQ5we8wYKs5OwFa5blDA=
X-Received: by 2002:a2e:4408:: with SMTP id r8-v6mr409886lja.21.1542021008781; 
	Mon, 12 Nov 2018 03:10:08 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	h13-v6sm2982037ljg.80.2018.11.12.03.10.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Nov 2018 03:10:08 -0800 (PST)
Date: Mon, 12 Nov 2018 12:10:07 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181112111007.GD1148@toto>
References: <20181109173553.22341-1-peter.maydell@linaro.org>
	<20181109173553.22341-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181109173553.22341-3-peter.maydell@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-arm] [PATCH 2/2] target/arm/cpu: Give Cortex-A15 and -A7
 the EL2 feature
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
Cc: qemu-arm@nongnu.org, Adam Lackorzynski <adam.lackorzynski@kernkonzept.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gdK170VAjbvl

On Fri, Nov 09, 2018 at 05:35:53PM +0000, Peter Maydell wrote:
> The Cortex-A15 and Cortex-A7 both have EL2; now we've implemented
> it properly we can enable the feature bit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/arm/cpu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 784a4c2dfcc..b7185234d85 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1587,6 +1587,7 @@ static void cortex_a7_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
>      set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
>      set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
>      set_feature(&cpu->env, ARM_FEATURE_EL3);
>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A7;
>      cpu->midr = 0x410fc075;
> @@ -1633,6 +1634,7 @@ static void cortex_a15_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
>      set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
>      set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
>      set_feature(&cpu->env, ARM_FEATURE_EL3);
>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A15;
>      cpu->midr = 0x412fc0f1;
> -- 
> 2.19.1
> 
