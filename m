Received: by 10.28.71.27 with SMTP id u27csp827585wma;
        Fri, 23 Feb 2018 09:05:51 -0800 (PST)
X-Google-Smtp-Source: AG47ELs2WWFWLA7MRrRx3rK92p/X+mjClYrsmxAs9a9YDWhjRiY/En9hXTCo5DfRAczYU5EnFjRU
X-Received: by 2002:a25:e087:: with SMTP id x129-v6mr1591071ybg.217.1519405551563;
        Fri, 23 Feb 2018 09:05:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519405551; cv=none;
        d=google.com; s=arc-20160816;
        b=FurqO+tINcvyS/2ux9lfdtJpXMiASprvhSzGLh67RlTRFM1PFmlYNPCLj66dRWyV7Q
         tjgXQicqQDAbna+S8Q1y9K0rcpHXdXwrcNoV1k/EaERkRD1gYf9ImHf/tO0+pkBXBMEw
         I5DgqYR2qYL+HuxWJCL9nSsqJ5aeiLtMpaSDs8E9r15/ari9U3y3bcyE5VMKxsuh/yZC
         KO2eJV4yGEdWicu3asGZoytdY39JasN+n31gFlbGUEgu4uT329dn39ETX6vMoBJXtqt5
         I7tAt7JqeHPuMHHLX1lYZ86VDexhgyWI1jtDDi/OR8Z0ljhWZlOJUvLYyuNOyXJop2r2
         smiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:arc-authentication-results;
        bh=pz67KZgS+YOYn43LgjmEHtBzSBO0wbwmi9vhVSHKVDk=;
        b=EkaXLN8wqEFKclqk8QgIwamO8m7WmA3yUTgKMrLJwaub7SFKP5C1KzmB5QkwVAFSm7
         t2hbt4GubvJElURG4441ZC4x8CWI4xnTgnI12jXpULmpy8090Z3FVLkAu1LIJldgAHrT
         6f6WwXa9pvQLYw3x/dFO+XVyNdrUFBz4p2SSjPUzdUkHZ8PE2BZpqBFKHOiqDaKZs1+H
         kHS1kGJparY2yzHOQM8ePG3kCZVewzDyKk68BwSKodieWSUwB3S8kEv7YFddfclZO1jk
         PY/JxzfjX6+SbKYqlQQ4UJ5y6tw+oawnQoaNI8XAMKPVR5n5BBfG/SoZ5czyqGJTSXJN
         ZPLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id y80si618580qkg.480.2018.02.23.09.05.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 09:05:51 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 20C5D4040856;
	Fri, 23 Feb 2018 17:05:51 +0000 (UTC)
Received: from redhat.com (unknown [10.42.22.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F6A79C07A;
	Fri, 23 Feb 2018 17:05:50 +0000 (UTC)
Date: Fri, 23 Feb 2018 17:05:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v1 4/8] new contrib/generate_all.sh: batch
 risugen script
Message-ID: <20180223170548.GH31076@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20180223154613.2096-1-alex.bennee@linaro.org>
 <20180223154613.2096-5-alex.bennee@linaro.org>
 <20180223161723.GF31076@redhat.com>
 <878tbjac3d.fsf@linaro.org>
 <20180223164937.GG31076@redhat.com>
 <CAFEAcA-r7o=yMD+Mvo0-3Lpfe-Vvs_SdKOnJoOFnuNJn1oEdLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-r7o=yMD+Mvo0-3Lpfe-Vvs_SdKOnJoOFnuNJn1oEdLA@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Fri, 23 Feb 2018 17:05:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Fri, 23 Feb 2018 17:05:51 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-TUID: 4GjxA7xTIfsJ

On Fri, Feb 23, 2018 at 05:01:42PM +0000, Peter Maydell wrote:
> On 23 February 2018 at 16:49, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > If it is going to live in QEMU source tree, then avoiding introducing a new
> > license is desirable.
> 
> It isn't -- risu has its own repository.

Ah, I see what you mean. Disregard my comments here then


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
