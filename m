Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4435864lfa;
        Tue, 8 Jun 2021 06:43:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwJSggBLU39TNXm2yTZJ2Nki7r1t/9abXANPXKKkg8oYDABdSX6INzgBqoZyOS2N2sqPCZ
X-Received: by 2002:a17:907:970f:: with SMTP id jg15mr23794523ejc.59.1623159780371;
        Tue, 08 Jun 2021 06:43:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623159780; cv=none;
        d=google.com; s=arc-20160816;
        b=YMcfiwu4yEVWC0iQ+Rzt0drnu2RKvHK+8+QLXUkVRcEcfE1q9zNvoofy1ACcngGlCA
         BHm7mQRpV+BPGKLSaVDKp51liarGY56ge3LXLL4fjMV+XLxcz73yJ3+3ry11vazayNjI
         HgA2IUKMnMfss9J3HG55dJYFbF94VvnMPajhQpwD9Ac/ZukpwAbeR0w+lW5eD5X7Hc+5
         asrCjcb2nw+FL/O7FuSRWw2EO9Gp8fjRF2nohKfTLbnTxQvrjc+ShqXN6WVTe0uz6bg9
         0GOLltkaTOyTlAoUrhVXMHzSq7JkiKk9fTDwF+6+YodXHbQa9XawKtGR+340VdI71Evz
         KZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=j7IuGQU1F3AWvAOwsLcLSr8dFpaMTUqq6KmFXk8GOcg=;
        b=FApPxRzRfC6kBA/J9EeUn/z9mp7Jw54uNzuh1V43xofbAvlicln4JnIhS1zZ+VDTtS
         iWZKhzHGpQ3/5qSCRMUsoHYopIxnC2lAhAVgbqpK36h6RHrT16vgjnW/1OsVEhbnGX/l
         8xEnEYMC6xrCSwulA8aMguPk+aj1hMLGcmVMsAf39qHSf8Rgr52vRwKhNcffvLl4NgWA
         3QLn8v56xc5UelDho9fYfTvIzpeH6Mi3Ulhh8N/F2wWX41s8Rbl8oN+79xl+s6PVewpl
         fde4Q70iMP+iqFqLQIVIKOoz2i1AZUuf3VsRjMI+FPjaX+3URHR4Q9rSnFz+0qnWaQ+a
         RFXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AxJ8RKCB;
       spf=pass (google.com: domain of jsnow@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id u15si16119730edo.426.2021.06.08.06.43.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 06:43:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AxJ8RKCB;
       spf=pass (google.com: domain of jsnow@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623159779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j7IuGQU1F3AWvAOwsLcLSr8dFpaMTUqq6KmFXk8GOcg=;
	b=AxJ8RKCBE0OVEVq35a/f19XiH/mQmt+cUWHuFRtzj8w8QWv5xih5nr9q4vLewxly29J56t
	8Sf6inICG4YDGqTk5nUd1u4EN6PHHhhD6Scifzeaw7PUVEVFwwVFdEmf+4dhbFVlNZq2Kk
	Vja8VimMvZKZxHevaMP8CN7jSaSoAMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-dJl7a552MwS4A6pWfkQ-5A-1; Tue, 08 Jun 2021 09:42:57 -0400
X-MC-Unique: dJl7a552MwS4A6pWfkQ-5A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB9BA800C60;
	Tue,  8 Jun 2021 13:42:53 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF2595C1BB;
	Tue,  8 Jun 2021 13:42:52 +0000 (UTC)
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <83b32ad3-18a6-c9d4-6561-c3c880234e09@redhat.com>
Date: Tue, 8 Jun 2021 09:42:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-97-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: AstGk4MToJ2w

On 6/4/21 11:53 AM, Alex Bennée wrote:
> The assumption that the qemu-system-aarch64 image can run all 32 bit
> machines is about to be broken and besides it's not likely this is

What's changing? I'm not deeply familiar with aarch64. Why is this 
assumption about to be broken?

> improving out coverage by much. Test the "virt" machine for both arm
> and aarch64 as it can be used by either architecture.
> 

Sounds fine to me, but I didn't write this part of the test. Thomas, you 
wrote this section IIRC -- does this reduce coverage in any meaningful way?

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/qtest/cdrom-test.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
> index 5af944a5fb..1e74354624 100644
> --- a/tests/qtest/cdrom-test.c
> +++ b/tests/qtest/cdrom-test.c
> @@ -220,13 +220,16 @@ int main(int argc, char **argv)
>               "magnum", "malta", "pica61", NULL
>           };
>           add_cdrom_param_tests(mips64machines);
> -    } else if (g_str_equal(arch, "arm") || g_str_equal(arch, "aarch64")) {
> +    } else if (g_str_equal(arch, "arm")) {
>           const char *armmachines[] = {
>               "realview-eb", "realview-eb-mpcore", "realview-pb-a8",
>               "realview-pbx-a9", "versatileab", "versatilepb", "vexpress-a15",
>               "vexpress-a9", "virt", NULL
>           };
>           add_cdrom_param_tests(armmachines);
> +    } else if (g_str_equal(arch, "aarch64")) {
> +        const char *aarch64machines[] = { "virt", NULL };
> +        add_cdrom_param_tests(aarch64machines);
>       } else {
>           const char *nonemachine[] = { "none", NULL };
>           add_cdrom_param_tests(nonemachine);
> 
