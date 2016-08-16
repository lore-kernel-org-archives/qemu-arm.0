Received: by 10.25.21.156 with SMTP id 28csp2104854lfv;
        Tue, 16 Aug 2016 11:03:20 -0700 (PDT)
X-Received: by 10.55.56.129 with SMTP id f123mr41925712qka.30.1471370600616;
        Tue, 16 Aug 2016 11:03:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q62si17066070qkf.51.2016.08.16.11.03.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Aug 2016 11:03:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43482 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZihs-0000TF-2l
	for alex.bennee@linaro.org; Tue, 16 Aug 2016 14:03:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bZihh-0000Oj-No
	for qemu-arm@nongnu.org; Tue, 16 Aug 2016 14:03:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bZihf-00074D-Su
	for qemu-arm@nongnu.org; Tue, 16 Aug 2016 14:03:08 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:34991)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bZihV-00072k-L4; Tue, 16 Aug 2016 14:02:57 -0400
Received: by mail-qk0-x242.google.com with SMTP id o1so7076632qkd.2;
	Tue, 16 Aug 2016 11:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=EwUrFWjJntV4Irn//k8n+9SWBTRPe598aJuw15VV5Nk=;
	b=0qNE2Ds+mr6y4cHXJykutH1EZEtO/jl/gQ06lt81tvuClSpZJOpHru/7VZ31bfmvyQ
	h3+5eMpeBWWQ/gbxTH6LqxeVy6GE9tSNgpIpZRR4dgWBYyx2mccAkhMQkFE0CUlyMw2G
	2sY2yvoRbsZn5HtbHhchgt5pXL4jiravFNTyCYL+AxuvJDrWakBX/b8JYBqXRSYjE3Za
	KsFZ2H4Tqpqn+98ICan8XvbxaIIVpzwt3aU0q3q2z7/3YBp/0DFnPWMdPM/hJb7q0whM
	AmUX5c1e77vraACe8qOoe6H4tKpb/TFmjb5jXAPk/A5eypQOJpcSPYiXqWQOVMMGnC9b
	aD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=EwUrFWjJntV4Irn//k8n+9SWBTRPe598aJuw15VV5Nk=;
	b=mYgwSNx9/DqzhHUTYGZs8TYxqMYUTsabX0h+uag/1iB9StdW7+80BPTdlXKGx6KV8m
	uDM0hFQCEhPzvZTYRxqiAFmXwmIVHE119XMjLHhK2udW+0Cds3MKffjQYajJ9zdmIFh/
	eP+6fjx9WChW2x+Y4Yc4sl0WNmzTV7eVophXKrr07i8yUoCJ1OMb6Mo7WYO5UmUdftpq
	KyRYFjwwYnWcmMxF/UDwTGcY1sL9RZ35RKuBcthcm4Y2CL28i2gx7WRntmSdJJziCIPh
	Jh0jW3lyTON4vOZooDefaeo38Gwh8mr+4CDm32weZrEG6abn0V4B/s+tihJ+ikP+LIeo
	DbGg==
X-Gm-Message-State: AEkoousLWc7BfvHcIxv9KDBJRsWDWLiCAIDFWe2AalprXx1vUY9B0kknWDGkCIgLQEL4PQ==
X-Received: by 10.55.161.215 with SMTP id k206mr41964279qke.278.1471370575961; 
	Tue, 16 Aug 2016 11:02:55 -0700 (PDT)
Received: from bigtime.twiddle.net ([208.95.30.164])
	by smtp.googlemail.com with ESMTPSA id
	a193sm14428006qkc.24.2016.08.16.11.02.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Aug 2016 11:02:55 -0700 (PDT)
To: vijay.kilari@gmail.com, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	pbonzini@redhat.com
References: <1471348968-4614-1-git-send-email-vijay.kilari@gmail.com>
	<1471348968-4614-3-git-send-email-vijay.kilari@gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <0f3abe4d-9640-2cc4-41db-7d5e5924e63d@twiddle.net>
Date: Tue, 16 Aug 2016 11:02:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1471348968-4614-3-git-send-email-vijay.kilari@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [RFC PATCH v2 2/2] utils: Add prefetch for Thunderx
 platform
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Prasun.Kapoor@cavium.com, p.fedin@samsung.com, qemu-devel@nongnu.org,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nsIV9F23q+wI

On 08/16/2016 05:02 AM, vijay.kilari@gmail.com wrote:
> +static inline void prefetch_vector_loop(const VECTYPE *p, int index)
> +{
> +#if defined(__aarch64__)
> +    if (is_thunderx_pass2_cpu()) {
> +        /* Prefetch 4 cache lines ahead from index */
> +        VEC_PREFETCH(p, index + (BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR * 4));
> +    }
> +#endif
> +}

Oh come now.  This is even worse than before.  A function call protecting a 
mere prefetch within the main body of an inner loop?

Did you not understand what I was asking for?


r~
