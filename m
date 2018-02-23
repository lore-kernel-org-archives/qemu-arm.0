Received: by 10.28.71.27 with SMTP id u27csp776701wma;
        Fri, 23 Feb 2018 08:17:30 -0800 (PST)
X-Google-Smtp-Source: AG47ELtC3i5sDNckUr/eHdM7GTtUK/k5dMI2f+5cCg9mWgMH8CPNEkTj7znl5yNThP6xW+f7p6KT
X-Received: by 10.55.176.195 with SMTP id z186mr3440194qke.140.1519402650491;
        Fri, 23 Feb 2018 08:17:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519402650; cv=none;
        d=google.com; s=arc-20160816;
        b=ngNQB9HMZq8//TxgxaHlrC8/s9e2oG4yLHB/7Q6UI8DmqNqX0yE8tgQVOX3ADEm+1r
         buKTpXnsT7SSYOzVswOwwflmAbZYx08cCB7aRYVmnxYl2BziZbCWgH3L+f+VoAeMONLS
         3ijpmMX5g1eGE4Am8DI2J/wdzndzTvIecSZtm+XVGTBuqSoCCSsAB1iBTTlX1VZ5D2no
         PEtpbooDroFtDhl0Lhwts7cM8MhAJ6s6qxRiBDOsLi/jSIB1/1wF/Ypa2G3utNBKCgE3
         jY6oq6zr/7JohYIVq0DCfgJQAJFY6W1D6aUB8yWDD+FY2mqXA4DB6wrze9Rrdz6FzJwY
         Y4fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:arc-authentication-results;
        bh=G5GL++ggHvv0Ph5aKaZ4fY/Yv9SyL2zoWtN2yVdXUrM=;
        b=gp1dDxG7atyeZIB7TAXhkGSnxDkYsLbbNoQdxLDytaZRDuUpwJkG9sMHBPl1XAm2Gy
         4MJx+1jbNUmBZODB0fup6aqPo/7AgiRcyy8LC75jJGkGedv3QJzudrRD3fOsipYkpAGs
         Ohjpj9leE1RUVGASfTuHM280CDt+R/UlZzGEIvFfzahHelQ2hjoIWePUc1Roy5N+8Yon
         qcYI7ZtbPn4sl/g5ViOQHHw8jeDRIo9iClH1f+hlJmZucsgAYEca7syHujHbOPzdSAL2
         5Nv/CIwiU5VjHrZPjg4AhV5lFq6/x0eXeTotR2QAtzPS54hJOw7j9j1U57YQwnN4Mh6t
         Lq+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id g11si2471741qkb.486.2018.02.23.08.17.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 08:17:30 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E08FEB6F6;
	Fri, 23 Feb 2018 16:17:30 +0000 (UTC)
Received: from redhat.com (unknown [10.42.22.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56A602024CAB;
	Fri, 23 Feb 2018 16:17:25 +0000 (UTC)
Date: Fri, 23 Feb 2018 16:17:23 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	richard.henderson@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [PATCH v1 4/8] new contrib/generate_all.sh: batch
 risugen script
Message-ID: <20180223161723.GF31076@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20180223154613.2096-1-alex.bennee@linaro.org>
 <20180223154613.2096-5-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180223154613.2096-5-alex.bennee@linaro.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Fri, 23 Feb 2018 16:17:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Fri, 23 Feb 2018 16:17:30 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-TUID: GVTpuW4AukXk

On Fri, Feb 23, 2018 at 03:46:09PM +0000, Alex Bennée wrote:
> This is a simple script for generating all instructions in a given
> RISU file. You can split up the batch size by passing a -n N command
> line options. For example:
> 
>   ./contrib/generate_all.sh -n 2 hp.risu testcases.armv8.2_hp
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  contrib/generate_all.sh | 96 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100755 contrib/generate_all.sh
> 
> diff --git a/contrib/generate_all.sh b/contrib/generate_all.sh
> new file mode 100755
> index 0000000..1e6b847
> --- /dev/null
> +++ b/contrib/generate_all.sh
> @@ -0,0 +1,96 @@
> +#!/bin/bash
> +#
> +# Generate all patterns in a given RISU file
> +#
> +# Copyright (c) 2017 Linaro Limited
> +# All rights reserved. This program and the accompanying materials
> +# are made available under the terms of the Eclipse Public License v1.0
> +# which accompanies this distribution, and is available at
> +# http://www.eclipse.org/legal/epl-v10.html

Really ? Why this license not our standard GPLv2+, or BSD if it is wanted
to be a public-domain-ish license ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
