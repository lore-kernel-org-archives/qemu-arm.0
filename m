Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3483141lfa;
        Mon, 7 Jun 2021 06:16:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsFD9B5aQg+C4z+tr+q6isE2CT4aVgGrTfouTT2e+Wks1jp+RYk7voHuY3lpJivIhnajXf
X-Received: by 2002:a17:906:a458:: with SMTP id cb24mr17943576ejb.482.1623071779770;
        Mon, 07 Jun 2021 06:16:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623071779; cv=none;
        d=google.com; s=arc-20160816;
        b=YvFrFh+tHQmstbMdJ0sGNCKL4ntg9hFc7brU8Hy4+8pwvtbg7ZZbbzyX/MwEvoPW6y
         xFpYpB64EtMNZ141YZ51Q23mHVij2jBC3BNUiJ1+viNwcHEX2CfFJjcDsmtaAjuALp8c
         ijWtSFrD0GxLaK+4PNZBiIh4IgstqWO315WCoXL0d3jadO8xeynxPTD5fQ6y3zvOVyYu
         iamaiKQg/swxHqyanhQpuz+tQsoWe5Olz7kA4xmcYjQAvO68zLLApbi25s9nfqb4enFG
         LKgh54IC4Q26Zk41CAztm3EGVzeC6tvH0o7pW2AMpoJuHNnXhfYiWfH7NHYZ5a0iVtsL
         2hFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=2zZHMo6ptWjPE7czEJ//BuQkE8oL6DgKVCgbQSDr9Ug=;
        b=dtgAtuGEh6F/pVzQphTj3OUhzPVrLKF03f0/GOxLNm118HHI8v9XVVy86F0/S4e1kr
         8z+p24x3QDx6hBbw1fA6SYw4oocma1UQCGJoyyzroO7+wJrBq+NX3SbojhiLXg7pbLMh
         KWwMI4uRKVoGYMIRJ1oFxEFsjHkz0z0lINVSFuJbxrBxl5dy3woU6DwCclNc174cpkXP
         y0cwGFQCALgEh4OjEdhVEZUfuMgXK2U8C9xaBsQxmeynC009ArTsDwA6QZbHcEpXRtPB
         R2vQF5w966+2mKpINpaqnljyNPxKrKXA/tYeKHyyVUUx4/FfwJfTVYWmyk/dGX6NKR0Z
         igSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="SXL/+U1R";
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id e19si12436656ejb.113.2021.06.07.06.16.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 06:16:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="SXL/+U1R";
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623071778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2zZHMo6ptWjPE7czEJ//BuQkE8oL6DgKVCgbQSDr9Ug=;
	b=SXL/+U1Rwf9pTqW6w7FM//GFET8dFptI0AjREiW/kxb0DN++MkVzr7NEer2K5J4nnbVjec
	DBxw7WY1Mxm3j/FySzg3cY8cCRp9xVGg9ntRBlL48ZdZ7wlY5fR8jo8fq+kxU9OvdDVnkz
	sItwbc84sFVfe8lceF5aqJfsK5PODTQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-xybo3NcKP1GGhvwx0530qw-1; Mon, 07 Jun 2021 09:16:17 -0400
X-MC-Unique: xybo3NcKP1GGhvwx0530qw-1
Received: by mail-wm1-f69.google.com with SMTP id n127-20020a1c27850000b02901717a27c785so6808318wmn.9
        for <alex.bennee@linaro.org>; Mon, 07 Jun 2021 06:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2zZHMo6ptWjPE7czEJ//BuQkE8oL6DgKVCgbQSDr9Ug=;
        b=hKFydcLhhImiGNHgC7dNhipP4sicdSdzdGAkr1qEfBEvi+kXna1WRhvZSU/Y3QYXE2
         LEpBkFvJthVWKd6VGaU+h6BEHTR/C2HveHZX12sfZA8fsrtkL0CD/j5v6vGSAksFowW2
         VO80f+JHI5iSZ1dSDaDhm/+iR2xTMjAHbZ5ZtlfKxNy/3J3SLA8HJhsKZHBYryZH1Brp
         E61WlqKUF+qs7TCD06y0dG+aBaIwtffdOac4qLdqKba7hk25BhxEYI1uwKCeBAn5paga
         SdhLcVu6Yet8ElfWKOH6v2vG22YPhrnspC9+DPEZVJSk6DoPExRvleYm85/Ki8nES8y3
         Th/A==
X-Gm-Message-State: AOAM531soObZsUXPYg1T73/JwWoL+6Rsig9T1K0kANez+GI5TDDXnJGE
	yp6cUELlMIk7VgaUHHQB6HrgyRKCra4r7OJvt0S8KDx8pn/HDLy4z0i5VnOuEqwrNBPYsVcAtuO
	ckfLeosztSgCX11Uj
X-Received: by 2002:a05:600c:2248:: with SMTP id a8mr17236649wmm.5.1623071775892;
        Mon, 07 Jun 2021 06:16:15 -0700 (PDT)
X-Received: by 2002:a05:600c:2248:: with SMTP id a8mr17236635wmm.5.1623071775754;
        Mon, 07 Jun 2021 06:16:15 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from thuth.remote.csb (pd957536e.dip0.t-ipconnect.de. [217.87.83.110])
        by smtp.gmail.com with ESMTPSA id o9sm13707257wri.68.2021.06.07.06.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 06:16:15 -0700 (PDT)
Subject: Re: [PATCH v16 03/99] qtest: Add qtest_has_accel() method
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-4-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <088d554c-ef63-0f79-cedb-bdc89b532490@redhat.com>
Date: Mon, 7 Jun 2021 15:16:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-4-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: LLI4noLzjCbk

On 04/06/2021 17.51, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Introduce the qtest_has_accel() method which allows a runtime
> query on whether a QEMU instance has an accelerator built-in.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210505125806.1263441-4-philmd@redhat.com>
> ---
>   tests/qtest/libqos/libqtest.h |  8 ++++++++
>   tests/qtest/libqtest.c        | 29 +++++++++++++++++++++++++++++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
> index a68dcd79d4..d80c618c18 100644
> --- a/tests/qtest/libqos/libqtest.h
> +++ b/tests/qtest/libqos/libqtest.h
> @@ -763,6 +763,14 @@ void qmp_expect_error_and_unref(QDict *rsp, const char *class);
>    */
>   bool qtest_probe_child(QTestState *s);
>   
> +/**
> + * qtest_has_accel:
> + * @accel_name: Accelerator name to check for.
> + *
> + * Returns: true if the accelerator is built in.
> + */
> +bool qtest_has_accel(const char *accel_name);
> +
>   /**
>    * qtest_set_expected_status:
>    * @s: QTestState instance to operate on.
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 825b13a44c..6bda6e1f33 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -393,6 +393,35 @@ QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
>       return qts;
>   }
>   
> +bool qtest_has_accel(const char *accel_name)
> +{
> +    bool has_accel = false;
> +    QDict *response;
> +    QList *accels;
> +    QListEntry *accel;
> +    QTestState *qts;
> +
> +    qts = qtest_initf("-accel qtest -machine none");
> +    response = qtest_qmp(qts, "{'execute': 'query-accels'}");
> +    accels = qdict_get_qlist(response, "return");
> +
> +    QLIST_FOREACH_ENTRY(accels, accel) {
> +        QDict *accel_dict = qobject_to(QDict, qlist_entry_obj(accel));
> +        const char *name = qdict_get_str(accel_dict, "name");
> +
> +        if (g_str_equal(name, accel_name)) {
> +            has_accel = true;
> +            break;
> +        }
> +    }
> +    qobject_unref(response);
> +
> +    qtest_quit(qts);
> +
> +    return has_accel;
> +}

This spawns a new instance of QEMU each time the function is called - which 
could slow down testing quite a bit if a test calls this function quite 
often. Would it be feasible to cache this information, so that you only have 
to run a new instance of QEMU once?

  Thomas
