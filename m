Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1099342lfk;
        Wed, 2 Feb 2022 04:30:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXORfv/LX1A5Z5yyJtdEBRcArWb8On7BcFifvfNdIRy+sguP0MUZHNNi3hPMWMyGsXOFdb
X-Received: by 2002:a17:907:1c90:: with SMTP id nb16mr13327026ejc.413.1643805041328;
        Wed, 02 Feb 2022 04:30:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643805041; cv=none;
        d=google.com; s=arc-20160816;
        b=YO9uGnCIRvE/brnSpFYvv/jLDgesUxG0mXYkeggAvE/k3cLSOsr7eKNU8Jjb2kznO5
         y5tu1Jq56azC5Wt5VbHls91VZ3SbtrbFNFp9r8z02G2e4oYVATd+o1c7RzHbhC6YTXgO
         x5haFcVrL8sFrl+SJh+9cJL/+tl6YErtVKCptk4HTH9+c7HBM/qYoeouQHK2oUDbmDR8
         J7L7sjksYGNnU9x0Aa6mHvSSNVWOGb9ePu28bV4qfq/LIQi15IQznelWJbBqX4qFey9t
         4gI8QHnG7qfAU0QdTqSlfSUnWnt0UNkB1cNYFE/AAvhmP0O3hHscTDtsE/EnO7cfGezS
         wZqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=L1jONM7iCKpU8cZ9ERTwXXeL7v62/eW4WOA2a7HXn8I=;
        b=fNUg35ZsMhaI5XrpFJ7N6/eXMYpy5VgRA3uJ+g8jCNmWMuhJAUq0QwtimJL8R7rHa5
         5IP9EEg4/+EUs9AJpFoViGRm3DxQW2C6/3PPD38A0GheYATijWN6Vxid168PXGQZozpv
         fzvrL7WTFeC3G0bdg3PYe/t1CnRpNM6siimtWnQL+FCsVVTr4bNz4zs6d51rNGZciXj5
         0YKeK/OuvVbe6Hg0ZVOXjXfwdolOEIvYjiz7Fs5IuKPV4L1Zxo6UkJlm6Y6mV2OCZ4YZ
         1sPTFUqT3Qhh87q9BZqsdEJlMRzabC3Ef3G55LZyniH2aP2eYHSKOuZSOPDYDweiVXU5
         x4zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bQdq2TLo;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id dn14si7249967ejc.383.2022.02.02.04.30.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Feb 2022 04:30:41 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bQdq2TLo;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643805040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L1jONM7iCKpU8cZ9ERTwXXeL7v62/eW4WOA2a7HXn8I=;
	b=bQdq2TLo0ZKmfc4ns/auvyvs8DzFr0zYvvGJ5Jt7oCdpuQpbnQMxqD50wPz+tGuyDvfSyq
	037o+1xpwo0y1Tn+3hGxKlvTJvbcBD1nVqs0hUGOJL+DoOfxRVfXUnP2f2IW0onTgY57qj
	QHtQEc8dlzjtb/8x0Xv8vjQHAe1PMA8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-JVn3RG0UOCiLZ97cB1-wXw-1; Wed, 02 Feb 2022 07:30:39 -0500
X-MC-Unique: JVn3RG0UOCiLZ97cB1-wXw-1
Received: by mail-wm1-f71.google.com with SMTP id r132-20020a1c448a000000b00352cf8b74dcso100775wma.0
        for <alex.bennee@linaro.org>; Wed, 02 Feb 2022 04:30:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=L1jONM7iCKpU8cZ9ERTwXXeL7v62/eW4WOA2a7HXn8I=;
        b=JpJKrVVRZbC6xw/kz8sygS+YR2FlYXnAGpbB0BZpZOqYZQAxjiACF+dFGtgx3ADnjV
         0h6qvPexaXDSulq+flXcqpZoIEif8x7GaiELnUVLKjEqCFPLzJqd+dmTNHvJSZxiWW3d
         1U6PNQ0CJdO4oSiA+AqVAzLqTQl4XAs7IakUeld3vttATbX7r/VhLhOMRCRtGaVVksT2
         QfbD4/VxNt89bmXtUxb7kyC8GWdZ5XRIfked0F4fDPDWPX6kw4p+x4GSrk1EPUuvOAak
         Yksd0L/zsc93w4/cgqAAF43h3qMa+dKlLmyR61P+G7ucuEEMs48nL+ME4Sa/PBmgQqFa
         IVhg==
X-Gm-Message-State: AOAM532sON8Z7OcWfcPsrFIszjhVlj24nRsXvTZsNKRIqQ1QGtHARknm
	EFZnwcKU+A/dDaeBfOs83qq1XZ5e3xFCCRg7noA0ePXU8imYBafntbsrueqsLbVX8cHD6F/f96K
	TZCZYvHySjC3VJxzsBQkNvSilPdnzyye0jtvnSjo49JqKyPzVqYaPMdXXhKmDJi+hC6E=
X-Received: by 2002:a5d:47a9:: with SMTP id 9mr25802751wrb.31.1643805038136;
        Wed, 02 Feb 2022 04:30:38 -0800 (PST)
X-Received: by 2002:a5d:47a9:: with SMTP id 9mr25802731wrb.31.1643805037886;
        Wed, 02 Feb 2022 04:30:37 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
        by smtp.gmail.com with ESMTPSA id s22sm4408356wmj.38.2022.02.02.04.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 04:30:37 -0800 (PST)
Date: Wed, 2 Feb 2022 13:30:35 +0100
From: Andrew Jones <drjones@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	richard.henderson@linaro.org, peter.maydell@linaro.org,
	ricarkol@google.com
Subject: Re: arm: singlestep bug
Message-ID: <20220202123035.sfbpexmqwyj2mnyl@gator>
References: <20220202102832.lwiyc5huddau4i6a@gator>
 <87a6f9wjd5.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87a6f9wjd5.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: uUU01X4UDoMa

On Wed, Feb 02, 2022 at 11:16:46AM +0000, Alex Bennée wrote:
...
> Side note:
> 
>   ad5fb8830150071487025b3594a7b1bf218d12d8 is the first bad commit
>   commit ad5fb8830150071487025b3594a7b1bf218d12d8
>   Author: Zixuan Wang <zixuanwang@google.com>
>   Date:   Mon Oct 4 13:49:19 2021 -0700
> 
> breaks the running on kvm-unit-test for me, I needed to patch:
> 
> --8<---------------cut here---------------start------------->8---
> modified   run_tests.sh
> @@ -31,7 +31,8 @@ specify the appropriate qemu binary for ARCH-run.
>  EOF
>  }
>  
> -RUNTIME_arch_run="./$TEST_SUBDIR/run"
> +RUNTIME_arch_run="./$TEST_DIR/run"
> +#RUNTIME_arch_run="./$TEST_SUBDIR/run"
>  source scripts/runtime.bash
>  
>  # require enhanced getopt
> --8<---------------cut here---------------end--------------->8---
>

You need to rerun ./configure to get a new config.mak file.

Thanks,
drew
