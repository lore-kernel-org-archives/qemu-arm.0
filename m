Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp10782410lfk;
        Wed, 24 Nov 2021 08:49:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNGeavxyXT5qW0QqXYZ+Wh3R5AyzNYCgKqHfACno/84E5y62eF0ah8jw8pz5T6e8UAfipb
X-Received: by 2002:ab0:6f4f:: with SMTP id r15mr12693008uat.17.1637772547126;
        Wed, 24 Nov 2021 08:49:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637772547; cv=none;
        d=google.com; s=arc-20160816;
        b=eFRc9vKWhhyElcH5J4UN26s2zLRywGNiOBFuR89sCiCD1sw2e92YvK3BdoSaU6pldX
         NUSnr5fxOVdnE4ErOtwBp560WCDpzM8F7oElp8pJ1ZQ2oa78XlULIJUXnX4Kno08+a7Q
         RD32PXGwz4Ba3D3sguo1sG8ALN/K02nuWYmtHt+o9nyzT6vB8ALICiLSJdox8jXywUAI
         t9/flihPl0mreBetIs4iPSEs74DtCU5+AFITo7Y06PlnYF0RcL+Ckypcy34td5Xros6u
         5DhVnY2GJvyIHu9dqioWwpM/x62adJYm89Owg5iqX81PFExDF0OE5EKAFzH7etolCxCq
         QZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=9J3cD1dyyOWaeZtyt11eMPdAt6Sv3JFpKNvzxQVuJ5s=;
        b=w6LgfwXoX1Np3mmAsaFyIGngnVzFzkkCtpfDlfvxySZjr68gcT2QFeVYVXXmol2kp9
         PCsROgqnx5v3nqqvgULpDBZkxS1jflCoPqWLyarwy88TeHUQpa0YMzIsa5Zdi0ZhgZyW
         2S+V5MjFcqmmlUazIzorEdaWto4a67qOnWaqfKV0Tkdme3CrGAcYNlAEg8eS+qYj1zrd
         mWE7uwEZrdinYtYUF3Jk/bO+i0sJgZL9Vz3qLNVOutEufvlzscEVnwloJXmFxvmEiHPn
         qvgPgginSGHicFT3v49WnuSoCJgXfJDEdltYi/cW8y0lZb0HcyqVRlbreXWGW0EEPO2u
         Uo3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Oq5EVYGL;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id l6si944215vkd.80.2021.11.24.08.49.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Nov 2021 08:49:07 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Oq5EVYGL;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637772546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9J3cD1dyyOWaeZtyt11eMPdAt6Sv3JFpKNvzxQVuJ5s=;
	b=Oq5EVYGLesKz89GaaZRFh31VvUR+dOceToWVNAgBN7DxbqXGGYIzaNw7i1Xj0v7gMxCYjr
	+nLzveLQ90riEGypIT9Xzmv9nbvsxF8uRv5XOoOKSL1CQ3DmEu4H5sbKn2GrVafoe0AYE0
	AKRAwjw02Er70f/400Dzk7okb6AvcIA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-Ag4TNieMOxise_u298LN4A-1; Wed, 24 Nov 2021 11:49:03 -0500
X-MC-Unique: Ag4TNieMOxise_u298LN4A-1
Received: by mail-wm1-f70.google.com with SMTP id l6-20020a05600c4f0600b0033321934a39so1747567wmq.9
        for <alex.bennee@linaro.org>; Wed, 24 Nov 2021 08:49:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9J3cD1dyyOWaeZtyt11eMPdAt6Sv3JFpKNvzxQVuJ5s=;
        b=rFEGR6sEXxj5QergWhaKJQ7qvK5qUZrk3WzuA6UYM+maq20MjjLFqSpdKkUEsGw7hv
         +njsAN9pFDLyUu6PAyyjdLgRZojRumlEuEUBxtAlKH6JN30/zX+82vP8lJhV8o7LJ6FN
         zLJZ01+xOKciFivzWnqiP94xhCA50l4Gty+6Db2wglEA8xmDaY4MmLjCdk/oDkFtT7g8
         AY/73wEDGFDFM8tO3oI9TFyD9l4Wp02AhhOBT+eG4jJVj6jnuipkf3IVX+PX6j9bu5Mm
         0HVbwO+qEyX7Q3qkOJcKpQ8WhsPKamIFuLw09jQvvb8LoB2VXU5CcHMzE0ptwep9xtKY
         2Kew==
X-Gm-Message-State: AOAM533X7be2Qbh9Jjx4YMijChaN+wTbLvRxMZ15fPrbhCyFeCq4C+CC
	WyREOD3WN5Vsr5LmARsw108xmBWoViCHELYKewgnmGnErMEwyguA+aBbYoqKiPB+RFzGVlqAUQH
	kE42yVE8b9AX5+O1ViRAqr2PXfquz6/frqq4tdKjARF+GxuE9FQ03ZlaiOW0+FCWohwE=
X-Received: by 2002:a05:600c:202:: with SMTP id 2mr17343013wmi.134.1637772541912;
        Wed, 24 Nov 2021 08:49:01 -0800 (PST)
X-Received: by 2002:a05:600c:202:: with SMTP id 2mr17342972wmi.134.1637772541675;
        Wed, 24 Nov 2021 08:49:01 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
        by smtp.gmail.com with ESMTPSA id o4sm6354481wmq.31.2021.11.24.08.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 08:49:01 -0800 (PST)
Date: Wed, 24 Nov 2021 17:48:59 +0100
From: Andrew Jones <drjones@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvm@vger.kernel.org, maz@kernel.org, qemu-arm@nongnu.org,
	idan.horowitz@gmail.com, kvmarm@lists.cs.columbia.edu,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [kvm-unit-tests PATCH v8 04/10] run_tests.sh: add --config
 option for alt test set
Message-ID: <20211124164859.4enqimrptr3pfdkp@gator>
References: <20211118184650.661575-1-alex.bennee@linaro.org>
 <20211118184650.661575-5-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211118184650.661575-5-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: bQlJ/kYEB8v+

On Thu, Nov 18, 2021 at 06:46:44PM +0000, Alex Bennée wrote:
> The upcoming MTTCG tests don't need to be run for normal KVM unit
> tests so lets add the facility to have a custom set of tests.

I think an environment variable override would be better than this command
line override, because then we could also get mkstandalone to work with
the new unittests.cfg files. Or, it may be better to just add them to
the main unittests.cfg with lines like these

groups = nodefault mttcg
accel = tcg

That'll "dirty" the logs with SKIP ... (test marked as manual run only)
for each one, but at least we won't easily forget about running them from
time to time.

Thanks,
drew


> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  run_tests.sh | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/run_tests.sh b/run_tests.sh
> index 9f233c5..b1088d2 100755
> --- a/run_tests.sh
> +++ b/run_tests.sh
> @@ -15,7 +15,7 @@ function usage()
>  {
>  cat <<EOF
>  
> -Usage: $0 [-h] [-v] [-a] [-g group] [-j NUM-TASKS] [-t]
> +Usage: $0 [-h] [-v] [-a] [-g group] [-j NUM-TASKS] [-t] [-c CONFIG]
>  
>      -h, --help      Output this help text
>      -v, --verbose   Enables verbose mode
> @@ -24,6 +24,7 @@ Usage: $0 [-h] [-v] [-a] [-g group] [-j NUM-TASKS] [-t]
>      -g, --group     Only execute tests in the given group
>      -j, --parallel  Execute tests in parallel
>      -t, --tap13     Output test results in TAP format
> +    -c, --config    Override default unittests.cfg
>  
>  Set the environment variable QEMU=/path/to/qemu-system-ARCH to
>  specify the appropriate qemu binary for ARCH-run.
> @@ -42,7 +43,7 @@ if [ $? -ne 4 ]; then
>  fi
>  
>  only_tests=""
> -args=$(getopt -u -o ag:htj:v -l all,group:,help,tap13,parallel:,verbose -- $*)
> +args=$(getopt -u -o ag:htj:vc: -l all,group:,help,tap13,parallel:,verbose,config: -- $*)
>  [ $? -ne 0 ] && exit 2;
>  set -- $args;
>  while [ $# -gt 0 ]; do
> @@ -73,6 +74,10 @@ while [ $# -gt 0 ]; do
>          -t | --tap13)
>              tap_output="yes"
>              ;;
> +        -c | --config)
> +            shift
> +            config=$1
> +            ;;
>          --)
>              ;;
>          *)
> @@ -152,7 +157,7 @@ function run_task()
>  
>  : ${unittest_log_dir:=logs}
>  : ${unittest_run_queues:=1}
> -config=$TEST_DIR/unittests.cfg
> +: ${config:=$TEST_DIR/unittests.cfg}
>  
>  rm -rf $unittest_log_dir.old
>  [ -d $unittest_log_dir ] && mv $unittest_log_dir $unittest_log_dir.old
> -- 
> 2.30.2
> 
> _______________________________________________
> kvmarm mailing list
> kvmarm@lists.cs.columbia.edu
> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
