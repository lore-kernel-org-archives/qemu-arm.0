Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5515871lfm;
        Wed, 26 May 2021 08:06:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUccs5uNccrDGJZYp2s8YejSUfbg2VYZicr4xrRtac/a/NjkceNb0aFtlerV5UxuS3RsaN
X-Received: by 2002:a05:6402:27cf:: with SMTP id c15mr38071600ede.130.1622041569721;
        Wed, 26 May 2021 08:06:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622041569; cv=none;
        d=google.com; s=arc-20160816;
        b=q8gw2XKuT/1ttLp7PBCkNA8oSJLClODeWrbSVmrfmCVDf7wxYKER7WuzN6yBCDvZH3
         HtUmG/kK0puSZTMIDvYnBiec0sN8rR1f4QFdM7R9a+H3g/EP6pkEks6GOxRAac8ptMcE
         dz+FaE1F96o/KAIVrwpzDJr88W1+GpB5MBh88Tb3nv3sn+TDAng/tqBvA0yamG+FGAAi
         QIhXaa10J0vBQ3hnvQSYLA0e00nzDJnjiXlc1Tk8rOBGQYxtcMdJnhntYm5FJDDF9VEi
         lKWhoChJlfW8jqoFp86Ub2DEa67XUvZrS+bPkKqkswcz3QG94I7AdIpcJoGiZw0j1mqb
         waag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=afXKeP+aN56rheXDqzdBoDJQ8Rg9z3z074x1aSluMhg=;
        b=bXp8OAYvcDLk6UosAicSiWGzUXx/qkktyaT7SfuXw+pBgkGd64gKOyQs/mpLIRfK/a
         QO910wZ/agoGVX+XdG4IyPZzNzGKBQPu+z5jCYXMy/x3XrL8v+Slnro11RW6fzfAa64h
         tJ+ZqbjntDoOx76C20QZ3tkHNR6LBI3+NR92oodhvhiZJbWDGjCPxlF/l0YY4RKVKXXt
         UtOAbOer9RAAp6oNJhfAYtbL9/2olUzQG+J3lsUHUWt0RvJXkqjbORvvJE9sPlXFn7cX
         1VWHa+rJOfhBYLgeoJF/NDI91o3IUqaCyk/qJwvS5dZjT2fUjoKtxERD7t/5DOG5N+cL
         aaTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f2ecgeoA;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id f25si13109266ejh.388.2021.05.26.08.06.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 May 2021 08:06:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f2ecgeoA;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622041568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=afXKeP+aN56rheXDqzdBoDJQ8Rg9z3z074x1aSluMhg=;
	b=f2ecgeoABTmaMQVXuZCFZMeCqCBfR7Rb7eRGL/DzRrDhx61LKhER4YONrq/q16vBkbd8UN
	ucxqAyIva8/6lwy6spUNxzyEeNlaavHY2ke6lND2Ge/vdBys5gpH63cG5adU0lojnkPjOQ
	yn1iyIykf2OdiDuw9XYx/x7ccLjyxTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-tJpmB5i8Nb2M4hnRU64YeQ-1; Wed, 26 May 2021 11:06:05 -0400
X-MC-Unique: tJpmB5i8Nb2M4hnRU64YeQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 735B9FCA3;
	Wed, 26 May 2021 15:06:04 +0000 (UTC)
Received: from [10.36.112.15] (ovpn-112-15.ams2.redhat.com [10.36.112.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9436061094;
	Wed, 26 May 2021 15:06:01 +0000 (UTC)
Subject: Re: [kvm-unit-tests PATCH v2 2/4] scripts/arch-run: don't use
 deprecated server/nowait options
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, kvm@vger.kernel.org
Cc: shashi.mallela@linaro.org, alexandru.elisei@arm.com, qemu-arm@nongnu.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 christoffer.dall@arm.com, maz@kernel.org
References: <20210525172628.2088-1-alex.bennee@linaro.org>
 <20210525172628.2088-3-alex.bennee@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b99b2c07-33e9-7f18-5a43-8ece655fe594@redhat.com>
Date: Wed, 26 May 2021 17:05:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210525172628.2088-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-TUID: U+ZpJzTqfmSp

Hi Alex,

On 5/25/21 7:26 PM, Alex Bennée wrote:
> The very fact that QEMU drops the deprecation warning while running is
> enough to confuse the its-migration test into failing. The boolean
> options server and wait have accepted the long form options for a long
> time.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Shashi Mallela <shashi.mallela@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  scripts/arch-run.bash | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index 5997e38..70693f2 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -122,14 +122,14 @@ run_migration ()
>  	trap 'kill 0; exit 2' INT TERM
>  	trap 'rm -f ${migout1} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
>  
> -	eval "$@" -chardev socket,id=mon1,path=${qmp1},server,nowait \
> +	eval "$@" -chardev socket,id=mon1,path=${qmp1},server=on,wait=off \
>  		-mon chardev=mon1,mode=control | tee ${migout1} &
>  
>  	# We have to use cat to open the named FIFO, because named FIFO's, unlike
>  	# pipes, will block on open() until the other end is also opened, and that
>  	# totally breaks QEMU...
>  	mkfifo ${fifo}
> -	eval "$@" -chardev socket,id=mon2,path=${qmp2},server,nowait \
> +	eval "$@" -chardev socket,id=mon2,path=${qmp2},server=on,wait=off \
>  		-mon chardev=mon2,mode=control -incoming unix:${migsock} < <(cat ${fifo}) &
>  	incoming_pid=`jobs -l %+ | awk '{print$2}'`
>  
> 
