Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp977113njb;
        Thu, 26 Sep 2024 07:24:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLelBqC+y75/+pCVBnloXKkrDyE3LABAR9RPrgzQnjOm/KO2d8hHesdvxhDKBSX2oprUoLpcBSaGSsHw==@linaro.org
X-Google-Smtp-Source: AGHT+IFYdryt/wTBgtwwMGqHi4GewlEaE2gPY6dJKi6iDsTpa2PHJJQy5d0ebPRJFoRZtWVsXKUW
X-Received: by 2002:a05:622a:1aa3:b0:458:2f29:5d3f with SMTP id d75a77b69052e-45b5e0324c1mr96925321cf.38.1727360691633;
        Thu, 26 Sep 2024 07:24:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727360691; cv=none;
        d=google.com; s=arc-20240605;
        b=cZUoNkMD9CvvM0WaSFlHVX6BBGpAVcwaSSzPOiuql/rKJTmDT8T/FWdZimSvDXeUkf
         9ZuygKRmLeiWHEfFN8xTVoBaz20tg3oWQpzDKb+DB6uMrnqudQIjpNEHi4GLlrlRoMcD
         XamiKw422sSSsQGeluOqvVIfuqj49KchFTU4y58hhjbkSZjP2QVpK6+bECAu+852OxZL
         dx07uowCp41hXJ3COHHN1TIlYKbmTM6JJyM5osZVtJ+Z4tHw5yudnHihpLfEDIT84+vd
         rcS98atBUfKQ20TfJoQm7tmYU7Q9yqxf0qz6oUVfEcSMBm9GbrtTvBe7mTV/wvtuayer
         MUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=lUEzhFOvUeyALpye2uhaBNImniIZgsHyOIPofc388uY=;
        fh=j7GA3EfRet1H7jTzv9UDgZNjw8MUZeXqIU5NskuDe5w=;
        b=aFJ9066oKqCZuXevegtF1jguFim4DfUUbUusMLpYHw7lvMorKkXDLKg/1URMr257OW
         A5aySjyaMyJuDcUp5yOdkMRYjhFAmhaWw155e4n7X4y6JhCARV/8icM6bUKMzNC0EN4V
         2fYVZwcAgpaPeL0Rsx9iKPQRGw3rLDrF7kYxB4IukzQlRl+VZ6fNIoB7fGj9sdSWmbg2
         X0Y+wkjZN5kpWGiqFZYMqyaOfNNeWRDmKKdycukG2R0Sv3kPMaeF4rPgxJ9OV4QzYRwn
         45xj4o5ZA4l7mgIyDT4lWfdqBNvOdAVCn8EeJdhXDE1gC/3uydGv1szCnJbm0RBVKECU
         bZQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=m42N0InC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45b52680f6asi67129931cf.382.2024.09.26.07.24.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2024 07:24:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=m42N0InC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1stpQ7-0003YJ-SL; Thu, 26 Sep 2024 10:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1stpQ4-0003LK-Mj; Thu, 26 Sep 2024 10:24:37 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1stpQ2-000610-VC; Thu, 26 Sep 2024 10:24:36 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 361605C0F77;
 Thu, 26 Sep 2024 14:24:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F98C4CEC5;
 Thu, 26 Sep 2024 14:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727360672;
 bh=LWxaj5iNhhP3rDS/oE3mjCOoegafoGUrmfRPy36bfEE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m42N0InC24vU1kYEW9SHebL1etq04DumO5tIs2og2uYEi+d8943XM3bmsudtIy48T
 DxUIrAPjVhyU8WYVWpPR45oEnXiXKeBct1f5AxjhMDBpTWELMuXxw8UaWB//3T9py2
 mUzdTU8hNYSyYxtnqKtLIU4QyRxeZSGmsTt4COYoWbiUvWe6UOPamskbqB8kFd1rvE
 4MPE06HQQeuJZdXXxWAdotAIKS8DMYOAS3bZOVOFrf7O+SESBSoKCynsM6JiBZWTEY
 xOIpiyCfVUCU2+l76g6nE0lHEJ4A92axQrtAXXVzKcS1El5OgxD0R3r+AXxL8sAKgN
 jiR6gFQQaWUsw==
Date: Thu, 26 Sep 2024 16:24:28 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH 12/15] acpi/ghes: don't crash QEMU if ghes GED is not found
Message-ID: <20240926162428.4ecb16d8@foz.lan>
In-Reply-To: <20240926130909.00006135@Huawei.com>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
 <dc61673f18e44b0c169762a084b77acb6a76c738.1727236561.git.mchehab+huawei@kernel.org>
 <20240926130909.00006135@Huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.131,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: N3fPBz7evUSv

Em Thu, 26 Sep 2024 13:09:09 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> escreveu:

> On Wed, 25 Sep 2024 06:04:17 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Instead, produce an error and continue working
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> Make sense as defense in depth. Can we actually hit this for existing
> systems, or is the injection stuff disabled if the ged isn't configured?

What happens is that:

- with memory errors, this logic at acpi_ghes_memory_errors() will
  report the error, just like error_report():

	    if (errp) {
	        error_report_err(errp);
	        return -1;
	    }

  so, no practical changes.

- for injections via script, this will return the error via QMP
  interface, preventing the guest crash.

The script can then handle it the way it wants (right now, it just
prints the error).

Thanks,
Mauro
