Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp362381ejc;
        Tue, 11 Apr 2023 02:08:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350YC7doSQfviIA2w52Imwk+pxVNaR94+u585WoogvzucHZyt4brJiALdSyorL0PJ2u6Y/R0G
X-Received: by 2002:a5d:6d49:0:b0:2d1:7ade:aac with SMTP id k9-20020a5d6d49000000b002d17ade0aacmr9990608wri.0.1681204125663;
        Tue, 11 Apr 2023 02:08:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681204125; cv=none;
        d=google.com; s=arc-20160816;
        b=E0bxM6sejG/MWTJYmUw7zD4S+9P5f7c5WXheDc1DFoykSLQnX5dTv9r+XBqcgafPdK
         xoNPHwi44HTgiRGRcyHzAWCIT/8qLqanOBLGx6L02+s9S4CM3LM4dT5q0R1BGl/8lKLF
         Pvk60RfB/170hryyKWO1K4AoBufJbAZ5ZfXVRbZADybsfcCfcNS3/2ZjxL4rF6pZhP/W
         RJbTibv8eiibKY+Ta+0IQcxGoGhjMN6hXPkT6Un0Trq8WVD0Gjtgn/tnD360Vn+szV0g
         U43Wnv+uApGUBQD+rrRUGJEeY8ZI2Vhn4KaLATvW4q7m6d6zJo+1v4jn5ffYa9ZI/YvH
         Q+yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from
         :dkim-signature:date;
        bh=I2iC8buvK2tS8ozL9BHGlo/Sy4UT6qIVUL5c6wk4p6g=;
        b=wV4oy59FPtw2T81yHc4G3QfpyqgCtIlvQIzPzkb6jKZTkYPl86736lQwdun7EXxkaV
         Fb2iSbshR/3PtEjHh1tyNrkOQhp5eQOiJCRSs6QH7nj4X4Gx+tyh5SLfqVT3j9fApvh8
         HMeOw2s1QbSMJRssKLqR0eI3Dv0+SAEp0tg4V1kiS1sjTA+88fb9aXKinG27C2zED01N
         EhcJEdwFSNqeg2CJElvB7DZ9o1GAeWkPC9evM7h5EhWcDQz1YjkGJ8uYgi9ionRacuaA
         6I9vdt+bRteAS5uMz0P7F7dk1xHZj19S4z4LcoNIOw/80ZPtcnERv+2axqfhrVtDUUWU
         CiJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=jDlTpk0m;
       spf=pass (google.com: domain of andrew.jones@linux.dev designates 91.218.175.1 as permitted sender) smtp.mailfrom=andrew.jones@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <andrew.jones@linux.dev>
Received: from out-1.mta0.migadu.com (out-1.mta0.migadu.com. [91.218.175.1])
        by mx.google.com with ESMTPS id b1-20020adfe301000000b002e695acbbfdsi8651298wrj.1072.2023.04.11.02.08.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 02:08:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrew.jones@linux.dev designates 91.218.175.1 as permitted sender) client-ip=91.218.175.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=jDlTpk0m;
       spf=pass (google.com: domain of andrew.jones@linux.dev designates 91.218.175.1 as permitted sender) smtp.mailfrom=andrew.jones@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Date: Tue, 11 Apr 2023 11:08:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1681204125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I2iC8buvK2tS8ozL9BHGlo/Sy4UT6qIVUL5c6wk4p6g=;
	b=jDlTpk0mHI9HGFG/mMYsZ8feUXZFsTYrXMBV5wrpq5gBMwvb/D9qBQrkCPFRqNvyAJEb4W
	P4y8LBz10RyPFh4MBpBmxUQknrrQybLiS/mbE8byvPCvvIGCxYHg6xrzoKogdNXTySydbl
	/Ezp9qgwjnJyILNj90gjOzfVQUX4280=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, 
	qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.linux.dev, qemu-arm@nongnu.org
Subject: Re: [kvm-unit-tests PATCH v10 0/7] MTTCG sanity tests for ARM
Message-ID: <hlno75xnob6jwbpfzwbwsjje2ujgfzw5kwvwmu2627obkmpqk2@dtcvgno2dkge>
References: <20230307112845.452053-1-alex.bennee@linaro.org>
 <20230321152649.zae7edlfub76fyqq@orel>
 <87mt3erhe3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87mt3erhe3.fsf@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-TUID: 0Ao1EA4Mi+Bu

On Tue, Apr 11, 2023 at 08:43:49AM +0100, Alex Bennée wrote:
> 
> Andrew Jones <andrew.jones@linux.dev> writes:
...
> > Someday mkstandalone could maybe learn how to build
> > a directory hierarchy using the group names, e.g.
> >
> >  tests/mttcg/tlb/all_other
> 
> So nodefault isn't enough for this?
>

nodefault is enough to avoid running a test with run_tests.sh,
when its group hasn't been explicitly selected, i.e.

 ./run_tests.sh

doesn't run the test

 ./run_tests.sh -g test-group-name

does run the test.

standalone test filtering is only done by filename (but
potentially pathname), which is why I suggested we someday use
the group names as directory names. Anyway, that's future work.
This series just needs to ensure it gets its group names right.

Thanks,
drew
