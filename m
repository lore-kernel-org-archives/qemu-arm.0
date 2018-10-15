Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4857365wrt;
        Mon, 15 Oct 2018 12:37:25 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61ZEOTEj68Fn/FPZ07V7/owXAJbX9AnO7rDgMms02FsAr+5mVUrO5j+loUYBg8eIRm2OW91
X-Received: by 2002:a37:38c:: with SMTP id 134-v6mr17035717qkd.194.1539632244961;
        Mon, 15 Oct 2018 12:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539632244; cv=none;
        d=google.com; s=arc-20160816;
        b=rEXukESzvCL/zrGMEZwkn8cAw8iuRGTow00BMIzW+kDm945NPfu/Z0VxpDRx/DbMkV
         tCkWSxYHd5lRVekTxbix2yUZ/8jc0biajlU0nrqsWlNrYbAEjvzbK3d5l59IC73jgHOP
         UaROqHwAuxEijcSx4UswFaa9ebDkLl0gu5bDZDiQVNgpk1acU+aAYl6Ak0MvXN4doMHF
         sl9ovKUDrSHVeoJcE+QbGU6BI6dyaY7UX8bJmjOjQh5jUA+yZ/4F2ZvhpHiA+SWUchSP
         TOmeVwabPcskISMnkc5AnfwQqBb2CM8NXnojfv93F6hmokNuy2GrrKTveNzUE8oPLuRC
         R9Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=mxnEpe1ZQM3mhWsLIyiiBAefPtIVwTbbQEz1xfjebro=;
        b=PlBtY+JpNr1ZVzjt9Bnzic9TwsFt7jp58ySrkOAX0B+jVobzEVlzYuSwaoG9cO6aiN
         7nuXz31b/SmCSfqRHQ4Dxg8B/cBbz8iyuxR5rGXGICrNTNHXH2JLRkO1NaQ2+ZQZ/tAo
         l9l85uHCrJSEGBfji8ikgkSY6HdrIPa2SIYxfyq/hmYCVSdn7Q7QSud43aPuEDXMQ9bJ
         xDgBlJ1fxENEuS/0J+LI9nvkdBhIUFzzTjmT0149ACBRx4Ik4u9XBZJpThn8OVOIGJkM
         YqWcrytvUkjfHoNE/Ge4YjEt1ZVMuuZfI7qBjHvVs2t7M3jYQ7nvl4cD0NCNfjTYnIQV
         AgGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z1FLEiNg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p27-v6si8048197qvf.61.2018.10.15.12.37.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 12:37:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z1FLEiNg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54530 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gC8g8-0004hd-Ep
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 15:37:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC8fk-0004gX-VB
	for qemu-devel@nongnu.org; Mon, 15 Oct 2018 15:37:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC8fh-00028k-8v
	for qemu-devel@nongnu.org; Mon, 15 Oct 2018 15:37:00 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:34500)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gC8ff-00027U-9k
	for qemu-devel@nongnu.org; Mon, 15 Oct 2018 15:36:56 -0400
Received: by mail-pl1-x643.google.com with SMTP id f18-v6so9795516plr.1
	for <qemu-devel@nongnu.org>; Mon, 15 Oct 2018 12:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=mxnEpe1ZQM3mhWsLIyiiBAefPtIVwTbbQEz1xfjebro=;
	b=Z1FLEiNgclBSsBDm+uMD8IxmQ1S2Vj9X7fv29n7mhu5QCdHVFGTi5LvH2aWCx2S/u7
	2BoqxeBAcmnZo3KtsvOpDtbZfZZo9X5mV+YYvubecjQwmCyF10A6RpRXbFDOtoIVQHjG
	uDxaSuidqhafgadPvt5Vrs8xEZTfBpsTH4IQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mxnEpe1ZQM3mhWsLIyiiBAefPtIVwTbbQEz1xfjebro=;
	b=Tv94rJvFBLsWPdMlOEKlHFXFyBT6M7B/NHjS23JjMvNpZDxH62SrF0eARM6H/Q5sC8
	A72r6se92ruK+qblA/7vEBphMZnQKMxrML35koEDdTZzRfa7OWJ5e1k2cjtt8cUB/xuA
	0tqxPqgXP3wUrj91Esacpa+uDtKS2pUVr8spa5/rBMtZsL8SmwyQ7n7bdCbVTzlMcvkr
	wrvs/JMX7cG/AGCrEsUQI4LgXN2gu31qtRENzzeynN41Q0JcC2sA9MS883Oehj+DzagL
	Zm0KVtdRuto/kVlg2rNOCw14E6UgQ+nZcw0sheYQzth9rIBSaCm9LdeDY8aciTKZ2J8P
	zp4g==
X-Gm-Message-State: ABuFfoi+FBKsXpUN/oAdC4TjLq9RrUQ5q/2FJplFfuJq6L/pAgVZOUA0
	l/qGl7WKFGIuK1VqACMC9ojz4A==
X-Received: by 2002:a17:902:7b83:: with SMTP id
	w3-v6mr18502185pll.285.1539632213403; 
	Mon, 15 Oct 2018 12:36:53 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	t184-v6sm10896913pfd.14.2018.10.15.12.36.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Oct 2018 12:36:52 -0700 (PDT)
To: Aaron Lindsay <aclindsa@gmail.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-4-aclindsa@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3a964ae2-a5d0-5960-9e15-7ede929a8294@linaro.org>
Date: Mon, 15 Oct 2018 12:36:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181010203735.27918-4-aclindsa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-devel] [PATCH v6 03/14] migration: Add post_save function
 to VMStateDescription
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>,
	Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GcqOSd7UXNkN

On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> In some cases it may be helpful to modify state before saving it for
> migration, and then modify the state back after it has been saved. The
> existing pre_save function provides half of this functionality. This
> patch adds a post_save function to provide the second half.
> 
> Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
> ---
>  docs/devel/migration.rst    |  9 +++++++--
>  include/migration/vmstate.h |  1 +
>  migration/vmstate.c         | 10 +++++++++-
>  3 files changed, 17 insertions(+), 3 deletions(-)

Hmm, maybe.  I believe the common practice is for pre_save to copy state into a
separate member on the side, so that conversion back isn't necessary.

Ccing in the migration maintainers for a second opinion.


r~

> 
> diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
> index 687570754d..2a2533c9b3 100644
> --- a/docs/devel/migration.rst
> +++ b/docs/devel/migration.rst
> @@ -419,8 +419,13 @@ The functions to do that are inside a vmstate definition, and are called:
>  
>    This function is called before we save the state of one device.
>  
> -Example: You can look at hpet.c, that uses the three function to
> -massage the state that is transferred.
> +- ``void (*post_save)(void *opaque);``
> +
> +  This function is called after we save the state of one device
> +  (even upon failure, unless the call to pre_save returned and error).
> +
> +Example: You can look at hpet.c, that uses the first three functions
> +to massage the state that is transferred.
>  
>  The ``VMSTATE_WITH_TMP`` macro may be useful when the migration
>  data doesn't match the stored device data well; it allows an
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 2b501d0466..f6053b94e4 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -185,6 +185,7 @@ struct VMStateDescription {
>      int (*pre_load)(void *opaque);
>      int (*post_load)(void *opaque, int version_id);
>      int (*pre_save)(void *opaque);
> +    void (*post_save)(void *opaque);
>      bool (*needed)(void *opaque);
>      VMStateField *fields;
>      const VMStateDescription **subsections;
> diff --git a/migration/vmstate.c b/migration/vmstate.c
> index 0bc240a317..9afc9298f3 100644
> --- a/migration/vmstate.c
> +++ b/migration/vmstate.c
> @@ -387,6 +387,9 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
>                  if (ret) {
>                      error_report("Save of field %s/%s failed",
>                                   vmsd->name, field->name);
> +                    if (vmsd->post_save) {
> +                        vmsd->post_save(opaque);
> +                    }
>                      return ret;
>                  }
>  
> @@ -412,7 +415,12 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
>          json_end_array(vmdesc);
>      }
>  
> -    return vmstate_subsection_save(f, vmsd, opaque, vmdesc);
> +    ret = vmstate_subsection_save(f, vmsd, opaque, vmdesc);
> +
> +    if (vmsd->post_save) {
> +        vmsd->post_save(opaque);
> +    }
> +    return ret;
>  }
>  
>  static const VMStateDescription *
> 

