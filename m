Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1327330ejx;
        Tue, 27 Jun 2023 02:18:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4/uacGy7Ks9N1iJHJpdDyZ5wztmiIN0v0F6lmxL0wE0+vh8hmWY0eFXjCIpJO7VLmWvVQC
X-Received: by 2002:a05:6358:ce12:b0:134:c8ee:e451 with SMTP id gt18-20020a056358ce1200b00134c8eee451mr2424101rwb.13.1687857513852;
        Tue, 27 Jun 2023 02:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687857513; cv=none;
        d=google.com; s=arc-20160816;
        b=FF1P6PNNAZpTReRDrGvvGiBaigs9fVN+ONwo821VQG88wRo/dAFNw9UUsKJn6lu0Dc
         Y/eQ6aPKrKg76MiaEec7PARhoy7KrRMFSK7Cxtkjq/gC85Y+8hxuBZ8UPw9PcKcwvWTH
         hCujAbOI6aHEM+vKQfBn0gPHa0cBif38Jm0YcUhZsv0NjtYXQ6nWemZBLI4/GjYXcNgq
         4VU9Pe+qiOS0YYZb29CF7c8AdKwUvPnaIh7AOqGkkK95VnD8Ka0s8kJExDUGOSjK3y5H
         WToL7RVl5OA+bkQFgMYEVRFaaQF0wOw+5VEXQeodo2aU7559ZZObp8AP27KV7b317wws
         oQpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature:ironport-hdrordr:ironport-data;
        bh=5S5Sc/3LZ+1++TQ1I0NqLGe2624ob6nHo/y/BztKGiQ=;
        fh=W7D4e6Q+GOKVpceTGkqF7nwJzsjjwS2BzGlbEr21HEE=;
        b=DSRBGogWNvMemQzAEgya7yDq7/plW2x6g2wRb5mjLIo48Zr8zt9BG0bFXIWCqcxt7+
         8UrqL5l4xv5v9e9PWJPgV3fe5ikoQAcx6i2cEQ8EUoVVOFypcn8EJG1c5sONDwHwTAT9
         1K+0Nz5iMj896mGLW/WsnNUvXBQORIJV/I+SACBI7/Zjc0Sb1IxSwwhLQc/NAdGIsTGd
         CzSRcQa98isbkBY8Gppp65yMBpZOvlZJNvCeOvD6EpmHDVysQU7GDtbso8FcoKbZp6RP
         q1ztyHIHICZYJApW/Bk1SE7hYb9et6nkEyVzrPk6fKh2KNLdxmY/0VcSpEup0fnubf24
         5xfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bu.edu header.s=s1gsbu header.b=CfQfy+kc;
       spf=pass (google.com: domain of alxndr@bu.edu designates 216.71.137.81 as permitted sender) smtp.mailfrom=alxndr@bu.edu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=bu.edu
Return-Path: <alxndr@bu.edu>
Received: from esa11.hc2706-39.iphmx.com (esa11.hc2706-39.iphmx.com. [216.71.137.81])
        by mx.google.com with ESMTPS id d9-20020a056a0024c900b0064f6a531c88si6172731pfv.323.2023.06.27.02.18.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jun 2023 02:18:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of alxndr@bu.edu designates 216.71.137.81 as permitted sender) client-ip=216.71.137.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bu.edu header.s=s1gsbu header.b=CfQfy+kc;
       spf=pass (google.com: domain of alxndr@bu.edu designates 216.71.137.81 as permitted sender) smtp.mailfrom=alxndr@bu.edu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=bu.edu
X-IronPort-RemoteIP: 209.85.160.198
X-IronPort-MID: 288405964
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5t4mWqCvwdTlsRVW/5Dhw5YqxClBgxIJ4kV8jS/XYbTApG5z1D0Fn
 DQbXm+CbKvcYGKgfNxybYrn8UwBuceDxoRrTANkpHpgcSl2pJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH2dOCn9SImvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3Zhn9glaYDkpOs/jY8E0146yo0N8llgdWic5j7Qe2e0Y9Ucp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VTKlLgFVHmZkl+AsBOtiN/Shkaic7XAha9hXB/0F1ll/gpo
 DlEWAfZpQ0BZ8Ugk8xEO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPA/+UzK0IvYbEi97pcCDlM+
 OUlcm8SO0Xra+KemNpXS8Fpj8UnadD3ZcYR4yAwiz7eCvkiTNbIRKCiCd1whm9hwJATW6+AP
 4xAOGoHgBfoOnWjPn8eDII4kP2AjGS5fjFFwL6QjfBnszSLkV0vjNABNvLlceDQeZ0En3/Hr
 0vI0H2+WysDHcaAnG/tHnWEw7WncTnAcIsWGa3+/PNshlCe7mgSDhQMUh28u/bRt6Klc9dWK
 khR4zZ36KZrpRztQd76UBm15nWDu3bwRuZtLgHz0ynVooK83upTLjJsouJpADD+iPILeA==
IronPort-HdrOrdr: A9a23:I9lW26B81+rxwvvlHelg55DYdb4zR+YMi2TDGXoBLiC9Vvbo6v
 xG+85rqSMc6QxhIk3I/OrrBEDuewK/yXcY2/h1AV7mZniYhILKFvAY0WKB+UyYJ8SWzIc0vt
 YCT0E9MqyJMbETt6bHCWKDYrAdKbe8gcSVrNab5VtWCS9RV4FcwzFQNju7e3cGOjWuxqBUKH
 Nf3Kd6TvabF0j/p/7VZ0U4Yw==
X-Talos-CUID: =?us-ascii?q?9a23=3AZfvbg2pcSiOCFydZzfaZJ9DmUewZYiD6z26MH3W?=
 =?us-ascii?q?1VU1gEL+YUGLKp7wxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AXTPOfQxlr7pCHTqoscFZxb1ngxuaqJSlNBoxycQ?=
 =?us-ascii?q?HgpaNHCJfInDEti2eWJByfw=3D=3D?=
Received: from mail-qt1-f198.google.com ([209.85.160.198])
  by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Jun 2023 05:18:32 -0400
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-3f9f44bba08so44376631cf.2
        for <alex.bennee@linaro.org>; Tue, 27 Jun 2023 02:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bu.edu; s=s1gsbu; t=1687857511; x=1690449511;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5S5Sc/3LZ+1++TQ1I0NqLGe2624ob6nHo/y/BztKGiQ=;
        b=CfQfy+kcH7kiUY+UoxH+oqamwZ2/0W3hEFpMOB4FsnxKXJAUk5PRTcsxtcPNS1NONg
         84LQdNjlbCjkLJO/hx5p+iG65YkN9R2UmV45V23oXJWkWfs5ruaXWPzPHERRyPdtO55g
         abwixsc6m43AngmZ460msf5bBpsvspLlYASyG6e5ve7aztRzZiSUkMFT/p7d9e7BOYFA
         kf+hg5A5QrVmdTg4psvlRMfO3+JmgOawOwHVxND5BFI/5FqOidqjDC4WPLMvk1MSGc3Y
         BGpPelnjVM3jwwJI3MMbYyMRc9r/Tez3868psV4OdZtbq3xto/NoLR0y/RgT9RW/hgZC
         lNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687857511; x=1690449511;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5S5Sc/3LZ+1++TQ1I0NqLGe2624ob6nHo/y/BztKGiQ=;
        b=Qvh4kykyoVyv2M8bzWyXWVS9p9V1CU6yO+U8mr2HD7M1clCv0sD6DmI5Q9qW4W30gy
         lWaFOdfBrKbsQRALdWQ82OCZw+O0bPlKbAF0nHlRqQ5GqkGDC8rVk8zOjLxmwuUOCuJ8
         3ccfL5XwRNKQ/Kx55G9vR55ClghDGI0Jp2rnnNo+/4t+M3WLt77pC8P9BAwfKnH1oZwW
         a/KrQxL0O4vVqL5OOOAcvvWGlH8mrAGBFrw+nL7+uXh3beTPVvQpOtBLMSBSYa/4OGsk
         X8cM2XtAK4yiHvabpJLUEMLUrkxDMLa16JKJnYarPCok2wa/vb85IJ1Z4SRs4ul8TiZ+
         6gxw==
X-Gm-Message-State: AC+VfDz7kZwzK+5fRFqxb5QI7j4b5HwQ3lmfVc+UpPOzEmCSqnjQh9X4
	EsC5T3WB7ALPvjDbsI7y1gdt+fqzmqNXfq2ZSfOAiBxr10Oni8EdhjmnY41WWeQwbjgPPeSyInh
	8DEvh93153Iab3L6m6E6HdxWgMBCkwea21FGslKI0uUGd
X-Received: by 2002:ac8:5c50:0:b0:3ff:466b:da7 with SMTP id j16-20020ac85c50000000b003ff466b0da7mr20010140qtj.45.1687857511505;
        Tue, 27 Jun 2023 02:18:31 -0700 (PDT)
X-Received: by 2002:ac8:5c50:0:b0:3ff:466b:da7 with SMTP id j16-20020ac85c50000000b003ff466b0da7mr20010108qtj.45.1687857511241;
        Tue, 27 Jun 2023 02:18:31 -0700 (PDT)
Return-Path: <alxndr@bu.edu>
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
        by smtp.gmail.com with ESMTPSA id j7-20020ac84c87000000b003ff654694b6sm4268578qtv.46.2023.06.27.02.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 02:18:31 -0700 (PDT)
Date: Tue, 27 Jun 2023 05:18:27 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>, Thomas Huth <thuth@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
	Leonardo Bras <leobras@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Beraldo Leal <bleal@redhat.com>, Peter Xu <peterx@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2 09/26] tests/docker: add test-fuzz
Message-ID: <20230627091827.5zil4m6anxwmrulp@mozz.bu.edu>
References: <20230626215926.2522656-1-alex.bennee@linaro.org>
 <20230626215926.2522656-10-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230626215926.2522656-10-alex.bennee@linaro.org>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
X-TUID: tlGB0fiGQGpF

On 230626 2259, Alex Bennée wrote:
> Running the fuzzer requires some hoop jumping and some problems only
> show up in containers. This basically replicates the build-oss-fuzz
> job from our CI so we can run in the same containers we use in CI.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

Thanks

> ---
>  tests/docker/test-fuzz | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100755 tests/docker/test-fuzz
> 
> diff --git a/tests/docker/test-fuzz b/tests/docker/test-fuzz
> new file mode 100755
> index 0000000000..7e506ae1f6
> --- /dev/null
> +++ b/tests/docker/test-fuzz
> @@ -0,0 +1,28 @@
> +#!/bin/bash -e
> +#
> +# Compile and check with oss-fuzz.
> +#
> +# Copyright (c) 2023 Linaro Ltd.
> +#
> +# Authors:
> +#  Alex Bennée <alex.bennee@linaro.org>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +. common.rc
> +
> +requires_binary clang
> +
> +# the build script runs out of $src so we need to copy across
> +cd "$BUILD_DIR"
> +cp -a $QEMU_SRC .
> +cd src
> +mkdir build-oss-fuzz
> +export LSAN_OPTIONS=suppressions=scripts/oss-fuzz/lsan_suppressions.txt
> +env CC="clang" CXX="clang++" CFLAGS="-fsanitize=address" ./scripts/oss-fuzz/build.sh
> +export ASAN_OPTIONS="fast_unwind_on_malloc=0"
> +for fuzzer in $(find ./build-oss-fuzz/DEST_DIR/ -executable -type f | grep -v slirp); do
> +        grep "LLVMFuzzerTestOneInput" ${fuzzer} > /dev/null 2>&1 || continue ;
> +        echo Testing ${fuzzer} ... ;
> +        "${fuzzer}" -runs=1 -seed=1 || exit 1 ;
> +done
> -- 
> 2.39.2
> 
