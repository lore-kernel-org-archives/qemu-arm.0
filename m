Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp353929ejc;
        Thu, 19 Jan 2023 06:06:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt1ITx3dAaQg0fG/y35KOVAb5t3E4xk8ORdKGxktoKT2L3yLXp2wv68pZU9GWc3kedKA5H0
X-Received: by 2002:a25:f54:0:b0:7b9:d20e:a99d with SMTP id 81-20020a250f54000000b007b9d20ea99dmr8292688ybp.31.1674137219598;
        Thu, 19 Jan 2023 06:06:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674137219; cv=none;
        d=google.com; s=arc-20160816;
        b=JSMQcO3jZ+BbGPTJUCK5C69z7TBohKkbwxcs5kDRI3bYp9WErqrK4M936PHogfXCgp
         uh+UeMCoHIJsvsKYbkuUf0vVseu6nzAsIPoJEoCqKjvGVSyBbpwblfH6/YiFm6FW6AhQ
         LirIa7Rr0JMRuosgMWV+fBAdAQR+jyZ1gaDRsZshRo8XCuHJc1/Fwa+IKhZo5Sg6j+so
         ftBqNsEk3XPIKh53w8nAwbJuSGQphRMTbqmdlTiVygT/SkQba6Higuji7ITda2WmY9JH
         xU7WeX8cCOp4FlRYpVfh0iSeglwRRKEpyGoe4AchGvl3K+UYzXr/TAr+zecxL99pNMQA
         nxKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:user-agent:in-reply-to:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=q7VptEAsu6EyqTaMheBg2vEhPZp9hALIjSxskec0D9E=;
        b=IEoZ+q6aRWYPXM+Polb7NfcV5fBz7TyusnifS/7DebLhq8h7ZogK7hMdFHOxshNFeK
         FCDO32ljRqiz8EnvXPn0FFHtWz094VyREOB3Pvozl43IOcm6Ja0wTstc5KgjTGMG8ZuQ
         y7l1Z2+W6ahU0oJUNL2tbTKVj3BQdUphiRGVcCnw2dyixVVHdqlIEf0Z2NTU7GDeDOlj
         25/9+W62OyYAnAqRTqElAGdiALkNxMPI9DlQNRnoxRs4n5zJF8S8nsYqEceZ64Aj6Et1
         OU1pR0u1Wu5TTDyewgBSmPaZL9LT8foxloW6XmK/tHFExXb35ldUjOM99rhGxwP/Fb5l
         BKvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dvSHGLPB;
       spf=pass (google.com: domain of dgilbert@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=dgilbert@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <dgilbert@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id cj13-20020a056902188d00b007d4d65ab007si21762930ybb.136.2023.01.19.06.06.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 06:06:59 -0800 (PST)
Received-SPF: pass (google.com: domain of dgilbert@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dvSHGLPB;
       spf=pass (google.com: domain of dgilbert@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=dgilbert@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674137219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q7VptEAsu6EyqTaMheBg2vEhPZp9hALIjSxskec0D9E=;
	b=dvSHGLPBG+Ixn8QrKZKyc0c41pBzh0TX6N9mWr+CAsQyBe0QInHSui/a6XkSdptbKCeCrb
	XftWRBqr2jW581d8INOTOidOWry6Ht5P7vtP/ZLy3WAeRXO5DhxjZ3tL0rMUO8N5xp1CIo
	7ObZSG6XHGTzUeSAPkn7UiTpG6o90Vg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-533-O-A7Wx6iPAG4XH-IyNZVzg-1; Thu, 19 Jan 2023 09:06:53 -0500
X-MC-Unique: O-A7Wx6iPAG4XH-IyNZVzg-1
Received: by mail-wr1-f71.google.com with SMTP id k18-20020adfb352000000b002bdd0a7a2b5so389674wrd.0
        for <alex.bennee@linaro.org>; Thu, 19 Jan 2023 06:06:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7VptEAsu6EyqTaMheBg2vEhPZp9hALIjSxskec0D9E=;
        b=4xYJHeOcol+EcdRdvG0J9xAkZBfiRMaJVWw5qDz6hfPiRAg0Z/PYzWoCQEB3yxErkr
         etf5DGBVOZlrPNk+toZVnUE3qKt9vuQ9nM8pwf/XThVfgfWSbWRJbXHJ5qpOoamyvdGY
         M4RJRAjpYRiELwYT5tvy8+FTNj4SpcvvqADf9owiDsBLSJXbgob2i/w8R3aKdB3K24/p
         JUyF3VOnOXEbuf+I9ZoNonO3QyA/6+g7TkwKsPleFEFE4g4ey3nvIJRO6PcDyqBqxTLU
         c6AhttkhXnhrqyAOiERmBF/cW2udTJ8b8fO5yf/Ae9mRGAIyzMUF/YBtxeIOU/J3Wcnf
         0hEg==
X-Gm-Message-State: AFqh2ko95GljlWG+FwAyFPOcso7fCy97XK8cwRbVTcwEuVqrPmwrjS9j
	Xc5a2mKJm3thnAqfRed6iQ88lLxpBUXoUk/EpEXkfNhpauByVbI/AJPSZi1cGZLkMyxCH6sVWIy
	SlTvSE521UmATgyKs
X-Received: by 2002:a5d:6b07:0:b0:236:695b:82d4 with SMTP id v7-20020a5d6b07000000b00236695b82d4mr9344770wrw.30.1674137211841;
        Thu, 19 Jan 2023 06:06:51 -0800 (PST)
X-Received: by 2002:a5d:6b07:0:b0:236:695b:82d4 with SMTP id v7-20020a5d6b07000000b00236695b82d4mr9344752wrw.30.1674137211598;
        Thu, 19 Jan 2023 06:06:51 -0800 (PST)
Return-Path: <dgilbert@redhat.com>
Received: from work-vm (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
        by smtp.gmail.com with ESMTPSA id l5-20020adfe9c5000000b002238ea5750csm19310627wrn.72.2023.01.19.06.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 06:06:51 -0800 (PST)
Date: Thu, 19 Jan 2023 14:06:49 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v4 08/15] tests/qtest: Adjust test-hmp to always pass
 -cpu option
Message-ID: <Y8lOeRqfcAUljaJN@work-vm>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-9-farosas@suse.de>
MIME-Version: 1.0
In-Reply-To: <20230119135424.5417-9-farosas@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: ptWV/2W4P4uh

* Fabiano Rosas (farosas@suse.de) wrote:
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>  tests/qtest/test-hmp.c | 34 +++++++++++++++++++++++++++++++---
>  1 file changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qtest/test-hmp.c b/tests/qtest/test-hmp.c
> index f8b22abe4c..c367612d4a 100644
> --- a/tests/qtest/test-hmp.c
> +++ b/tests/qtest/test-hmp.c
> @@ -121,21 +121,49 @@ static void test_info_commands(QTestState *qts)
>      g_free(info_buf);
>  }
>  
> +static const char *arch_get_cpu(const char *machine)
> +{
> +    const char *arch = qtest_get_arch();
> +
> +    if (g_str_equal(arch, "aarch64")) {
> +        if (!strncmp(machine, "virt", 4)) {
> +            return "cortex-a57";

Won't that break on a kvm host on a different CPU?
Would -cpu max   work on everything?

Dave

> +        }
> +    }
> +
> +    return NULL;
> +}
> +
>  static void test_machine(gconstpointer data)
>  {
>      const char *machine = data;
>      char *args;
>      QTestState *qts;
>  
> -    args = g_strdup_printf("-S -M %s", machine);
> +    args = qtest_get_machine_args(machine, arch_get_cpu(machine), "-S");
>      qts = qtest_init(args);
>  
>      test_info_commands(qts);
>      test_commands(qts);
>  
>      qtest_quit(qts);
> -    g_free(args);
>      g_free((void *)data);
> +    g_free((void *)args);
> +}
> +
> +static void test_none_with_memory(void)
> +{
> +    QTestState *qts;
> +    char *args;
> +
> +    args = qtest_get_machine_args("none", NULL, "-S -m 2");
> +    qts = qtest_init(args);
> +
> +    test_info_commands(qts);
> +    test_commands(qts);
> +
> +    qtest_quit(qts);
> +    g_free((void *)args);
>  }
>  
>  static void add_machine_test_case(const char *mname)
> @@ -160,7 +188,7 @@ int main(int argc, char **argv)
>      qtest_cb_for_every_machine(add_machine_test_case, g_test_quick());
>  
>      /* as none machine has no memory by default, add a test case with memory */
> -    qtest_add_data_func("hmp/none+2MB", g_strdup("none -m 2"), test_machine);
> +    qtest_add_func("hmp/none+2MB", test_none_with_memory);
>  
>      return g_test_run();
>  }
> -- 
> 2.35.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
