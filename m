Received: by 10.25.44.15 with SMTP id s15csp6404294lfs;
        Wed, 2 Aug 2017 10:34:26 -0700 (PDT)
X-Received: by 10.55.155.23 with SMTP id d23mr30562382qke.271.1501695266069;
        Wed, 02 Aug 2017 10:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501695266; cv=none;
        d=google.com; s=arc-20160816;
        b=n0GTdgZuCds0g5motsrwDefybBxIlaSi6FkZbtk8rDA41R3U4ZMVipBm3AWtv6no5G
         uFnbdjc1P3PPdrdgZ7/xj+p2PsOunX9qYJBvH1CXxH8g8sR4zhFe05kMTuX7kQ9LjJy/
         sRCcoKKcpxEYx213bKIVhZIdq4cgtw6T5UEMEH/311XTb2dczr4/mgMmVBT4C7IttzVI
         9Y/1864xWkKsNhoIsIgx7/BYHZH+nargcMmcx+XONtdZZd2dmkd7qDvDvtnldiATTe0z
         QB8kQRmdxXyqdL0GhElLshOt8tRPWbLe2wUYPK9YQ55DlYZorPHxYVrb3HDcyXwLLOdF
         DTAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=BM88O5twanY4zJCZ+R5gduiU75lErzMYcXZPssECQ6g=;
        b=PDB9ICF1HsgUJTul+t6dFUf659QRJdAQ0UqJRV3sRSnS1Sx9Y0XCp33SuPr4rEK4U8
         5Pf7j9VmCLmGxcOIq2FOlgbgH1oNPwElDvnTCUrydwEMYnn/Qvoih70U7kzhQuXY6zk9
         6R73SGC5ow50njlAlvJc6K+6CQqhhsBmE1YDq+NCQXNvUJsVtv1vQT+nQeX+j2VMUz+e
         yrgKbBnkoxD8rZ3Ru84/zFdxl9dui/vadUwQK0zAEvpVVnsFM3RX/fy2PVj0QI/spm7R
         Y7Giq94qhwqePljVFBe0VK0/6Wxc9Yi8vghtY0tIS6/ImPzPwzt1Gugn3CqYZpOPiWZD
         z8qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=WjFbJMQ5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o74si19192902qkl.185.2017.08.02.10.34.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 10:34:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=WjFbJMQ5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48934 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcxXL-0000DY-Ck
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 13:34:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1dcxXH-0000By-1q
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 13:34:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1dcxXD-0005Nk-4k
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 13:34:19 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:36085)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1dcxXC-0005MK-RN; Wed, 02 Aug 2017 13:34:15 -0400
Received: by mail-lf0-x242.google.com with SMTP id t128so4215350lff.3;
	Wed, 02 Aug 2017 10:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=BM88O5twanY4zJCZ+R5gduiU75lErzMYcXZPssECQ6g=;
	b=WjFbJMQ54axoL3c9jZK+vpzBKI0NCKJ3abEoEliZITmj2+80IX/Tn5kNHFmXrhA1Hr
	236L8VrbidoLWLSuGZjn3OQE/cUS2ujtVpZwRf0I/6CGE40vWca7VLwYXMpQdK3dsf+9
	AQiy2kAdc0DxCEU11jSKxKUlDYHK8ly6IVCyv8Q9+Mg0vpqTTGSzzZHpyJV25TKYGX6h
	SLWemDqEge2/Dr9Py3sGShnfxnqW65JHvNGtdet8l7057rymFOOu0uA67PneYNGAGrcT
	rWe6g1I5OMPCImRaSr6rFEtb2pEJ5RxpSNAjsoRoLBz9cbwuDyKdOc8lWlDmGyKFikP3
	56Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=BM88O5twanY4zJCZ+R5gduiU75lErzMYcXZPssECQ6g=;
	b=IQzNotuxi9JKp8AfLy4urWUwEJXMKJF7D3L9yqIbjn7tf1uInAGBJ2a3O5EStLoyP4
	pqpQ5+/Fk+7nzz53N3bgFkUnbElZoQtFuQ+wEeQ6lbDrIeeQ8uC8Pbd9sodQe4koD00Z
	7dK2wlVq5tlGIXVVtLoJh3gY8PV3253D9+G32YEL/mxAyb/Sgl4alfynfGQOdrXgZ/xS
	aYKnGVZAasdsSCiLqQCt1MQIuO40pfoi6g/lkeLQXj1Y7Lq6UAHACR0HuQFn8VEA30F6
	esRLB2KUT2nl2aHjm1G6vLi0fiQ4KF7Q8ljzlpfOTAWaR2CvBR9C8XlSDrUTjsYV7v6+
	kTlA==
X-Gm-Message-State: AIVw113rzjj2vXRf33ZdfajEpM6cv04zem1HzjARkn4NrGvn1PyW5lHI
	Tf4dcjQNKzwLSg==
X-Received: by 10.46.80.87 with SMTP id v23mr10501287ljd.156.1501695253388;
	Wed, 02 Aug 2017 10:34:13 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	b125sm4237545lfb.22.2017.08.02.10.34.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Aug 2017 10:34:12 -0700 (PDT)
Date: Wed, 2 Aug 2017 19:34:11 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170802173411.GH4859@toto>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-3-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501692241-23310-3-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/15] target/arm: Don't trap
 WFI/WFE for M profile
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iFHeTeo2HMtn

On Wed, Aug 02, 2017 at 05:43:48PM +0100, Peter Maydell wrote:
> M profile cores can never trap on WFI or WFE instructions. Check for
> M profile in check_wfx_trap() to ensure this.
> 
> The existing code will do the right thing for v7M cores because
> the hcr_el2 and scr_el3 registers will be all-zeroes and so we
> won't attempt to trap, but when we start setting ARM_FEATURE_V8
> for v8M cores the v8A handling of SCTLR.nTWE and .nTWI will not
> give the right results.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/arm/op_helper.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index 2a85666..5a94a5f 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -370,6 +370,11 @@ static inline int check_wfx_trap(CPUARMState *env, bool is_wfe)
>      int cur_el = arm_current_el(env);
>      uint64_t mask;
>  
> +    if (arm_feature(env, ARM_FEATURE_M)) {
> +        /* M profile cores can never trap WFI/WFE. */
> +        return 0;
> +    }
> +
>      /* If we are currently in EL0 then we need to check if SCTLR is set up for
>       * WFx instructions being trapped to EL1. These trap bits don't exist in v7.
>       */
> -- 
> 2.7.4
> 
> 
