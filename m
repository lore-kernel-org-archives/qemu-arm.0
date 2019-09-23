Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2998459wrp;
        Mon, 23 Sep 2019 11:47:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyPxJtsgGkY+nXInmsoPr+fzIY71Oj9tJ1TuWuwmNk2Fbqdf2gh8Cgf5HScFAnJeCeDaKyD
X-Received: by 2002:a02:7f8a:: with SMTP id r132mr1021374jac.46.1569264445399;
        Mon, 23 Sep 2019 11:47:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569264445; cv=none;
        d=google.com; s=arc-20160816;
        b=Iv0bKA7A6Cv0Yc1BqOt5XFPLzv6IF8+ZrJ4mBWMU+ahYvlD6BBnDTaAZGlNZ/+4g9z
         YjiBFqmU5ndwndwKly/wA8Y/ZVEKvqVBCfo0InIB0bt9B67RzKAWIC5aA3iDQ3gJg0zD
         LtzQ4VJ+FVRYhllJjb5G2VDBYFkF/kvuP8U9jfc5Zod7Ec3naXroe5n8ynRXt9of/iQm
         WZyBuWXHAYXNXJD1PJ/T77yoboSTJOpbZThGfjtFxl5vA6YmdzztPgboj8Gv9Vl7hWcD
         uRZLkhsWACrOlj8nGuvtX+nXhFsM3jXX3i9a8/4VGlA9hVl6mWORqNzHXojBPFwbo89t
         LG+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date;
        bh=EtNQ4Ej6D4WsQI8tc9msg1H151LMQPemOi45qwG2j5Y=;
        b=M4K3h1cHAgB/PtEDMgREItTJ4PxzZ9vgaAJpFqwIiA/xIF3SQcweInttL9Rxh0rLrI
         /IS/vJ3mzw7LoWa+JUDziKKeKI+GxjRy9VmEpO6aCa4moP99EukezKsg69q9z8rH/iKW
         /UwW8FstqvKM/fjBHxJH5XLbWoPl+i4QjEhrQvHEi/iPjlvW7tYw30QvOMXdRuiMf5l2
         bEUOU+Y79uIni7VY8iseDgo5WkaE2r2kip7/9fcH4EMadbKxmBJVXpT4q7EiMmHF6LL1
         OLK3u3bp5MgvDElHATudHDi+DG+7GSj7Ot6nwfTLYEreFaVwz89xMCydqO2AvEr0vGfq
         rrcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of crosa@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c185si15724483iof.23.2019.09.23.11.47.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Sep 2019 11:47:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of crosa@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8EE6898108;
	Mon, 23 Sep 2019 18:47:24 +0000 (UTC)
Received: from dhcp-17-179.bos.redhat.com (dhcp-17-179.bos.redhat.com [10.18.17.179])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E5A260BFB;
	Mon, 23 Sep 2019 18:47:19 +0000 (UTC)
Date: Mon, 23 Sep 2019 14:47:17 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
	peter.maydell@linaro.org, John Snow <jsnow@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org
Subject: Re: [PATCH  v2 05/16] podman: fix command invocation
Message-ID: <20190923184717.GB6528@dhcp-17-179.bos.redhat.com>
References: <20190919171015.12681-1-alex.bennee@linaro.org>
 <20190919171015.12681-6-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190919171015.12681-6-alex.bennee@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]); Mon, 23 Sep 2019 18:47:24 +0000 (UTC)
X-TUID: 1vMqBxvsMVy8

On Thu, Sep 19, 2019 at 06:10:04PM +0100, Alex Bennée wrote:
> From: John Snow <jsnow@redhat.com>
> 
> Oops; there's no argv here.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Message-Id: <20190913193821.17756-1-jsnow@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

> ---
>  tests/docker/docker.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/docker/docker.py b/tests/docker/docker.py
> index 4dca6006d2f..890e874ba93 100755
> --- a/tests/docker/docker.py
> +++ b/tests/docker/docker.py
> @@ -338,7 +338,7 @@ class Docker(object):
>              cmd = [ "-u", str(uid) ] + cmd
>              # podman requires a bit more fiddling
>              if self._command[0] == "podman":
> -                argv.insert(0, '--userns=keep-id')
> +                cmd.insert(0, '--userns=keep-id')
>  
>          ret = self._do_check(["run", "--label",
>                               "com.qemu.instance.uuid=" + label] + cmd,
> -- 
> 2.20.1
> 
> 
