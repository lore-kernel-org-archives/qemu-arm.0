Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3056234wrp;
        Mon, 23 Sep 2019 12:50:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXI7S0TzrFzLizwVF3CCyLRkg2PzNq0jGjlnnJDB5Q7L+N9UX78PUfcIH9iF+ihTurgEAR
X-Received: by 2002:a6b:7b4a:: with SMTP id m10mr1123173iop.163.1569268200269;
        Mon, 23 Sep 2019 12:50:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569268200; cv=none;
        d=google.com; s=arc-20160816;
        b=glz8vrcYMMeF5U1GdSlZwkhDjaD1q2d8NGJluXiWuVPqKYl6NEpX0j1q40wHLry6Pl
         rfrHn9VPCDkNZrJrcTKX9bZiRFLV3JDWQ96ot5eDS7q0nz0o+LDnpednXvze/nUkAE7k
         q5HOWIlzk8xoOipt1BT+IvUhqHRKE3HOmbXuCbdnrUEhGSVYDt3uWO1TmeJa6jMmuyvv
         tGQnsrg0yujQOyHr7MYJCI2YMQ1C+vqMw3muwkQGeyOOJKB00mhtSN5yZNH+rlCMLz/D
         IVcOmJ8fmV9V2H6Vjpg1mOoxNZw7oWoKVzHXB6rA1b3Z587hEOdymoAIPYSPBko0/iku
         9aow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date;
        bh=s+bvbZ+/CpOMCNQ0OfG2e6RNrqI5+BQoES1MAxOelm0=;
        b=0djOxCURX54ij2TGe/oApOtm1ldkyiqcd8teP6QBKMGgu0whEbYkHL7MiR3FF89d/P
         KXiBmXtrr2Clh7gv2Ak9v6F+HLSrGH62jidLkS2W8m4E1K0rfdgFn29fgBZSOkNbr0Qh
         a61x1k1hRug2RCXyg/nfhTVSBTS/KdwE6D4yoIwBtDyLxwdVRfmF9SRsrGRvpI9tkJob
         +5VCj7SFM5fVo2mJEZseNQjiisB7VD6g3IAxZo0p1zBCVLjczqisZmBsPRwgcA39CnCi
         VDlEN49v1SzDq9ZRM35btnAAl0vfTYV4ge9if8vsfutdJoDNJ0q8Aidg4nmW1gYw/2qN
         2M1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of crosa@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id r204si15497271jar.48.2019.09.23.12.50.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Sep 2019 12:50:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of crosa@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8166A3083362;
	Mon, 23 Sep 2019 19:49:59 +0000 (UTC)
Received: from dhcp-17-179.bos.redhat.com (dhcp-17-179.bos.redhat.com [10.18.17.179])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E2795D713;
	Mon, 23 Sep 2019 19:49:53 +0000 (UTC)
Date: Mon, 23 Sep 2019 15:49:51 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
	peter.maydell@linaro.org, John Snow <jsnow@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org
Subject: Re: [PATCH  v2 03/16] tests/docker: remove python2.7 from docker9-mxe
Message-ID: <20190923194951.GD6528@dhcp-17-179.bos.redhat.com>
References: <20190919171015.12681-1-alex.bennee@linaro.org>
 <20190919171015.12681-4-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190919171015.12681-4-alex.bennee@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Mon, 23 Sep 2019 19:49:59 +0000 (UTC)
X-TUID: jSXgeLUwnhIv

On Thu, Sep 19, 2019 at 06:10:02PM +0100, Alex Bennée wrote:
> From: John Snow <jsnow@redhat.com>
> 
> When it was based on docker8 which uses python-minimal, it needed this.

Assuming this docker8 was a typo? I mean, s/docker8/debian8/ ?

- Cleber

> It no longer does.
> 
> Goodbye, python2.7.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> Message-Id: <20190918222546.11696-1-jsnow@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/dockerfiles/debian9-mxe.docker | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/docker/dockerfiles/debian9-mxe.docker b/tests/docker/dockerfiles/debian9-mxe.docker
> index 7431168dad9..62ff1cecf2d 100644
> --- a/tests/docker/dockerfiles/debian9-mxe.docker
> +++ b/tests/docker/dockerfiles/debian9-mxe.docker
> @@ -16,7 +16,6 @@ RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C6BF758A33A3A276 &&
>  RUN apt-get update && \
>      DEBIAN_FRONTEND=noninteractive eatmydata \
>      apt-get install -y --no-install-recommends \
> -        libpython2.7-stdlib \
>          $(apt-get -s install -y --no-install-recommends gw32.shared-mingw-w64 | egrep "^Inst mxe-x86-64-unknown-" | cut -d\  -f2)
>  
> -ENV PATH $PATH:/usr/lib/mxe/usr/bin/ 
> +ENV PATH $PATH:/usr/lib/mxe/usr/bin/
> -- 
> 2.20.1
> 
> 
