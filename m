Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1115902njb;
        Fri, 5 Jul 2024 03:04:43 -0700 (PDT)
X-Received: by 2002:a17:906:3652:b0:a77:c6c4:2bb7 with SMTP id a640c23a62f3a-a77c6c42d80mr137551666b.1.1720173883450;
        Fri, 05 Jul 2024 03:04:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720173883; cv=none;
        d=google.com; s=arc-20160816;
        b=M020Gwm38JjvnVBuwpIOqp4yMASk/9EFZ6GkX+bww+r0Hxf5BLA5BzEPc3ydQQck/u
         5cFJae6Fg7G6D6jVjLqIZzzIhWHkgE7zv0bps5WfAaKmEUxr98eQTzwqS3Ch2AKeJkvo
         F0FdOzYLFQermmL05DNhAH2DUnhhg1jqwE1uWRAh2r0VNLUw8b/DY+8nR6mIV+f7ENBa
         CaAaEFmc12Eer3g04dgF5BQrzRes8TTQyr9WxnuUrXx4U/Fy1ORM8nUM6ULCAO1k7Sy/
         t5vCMGSYOsD6jsiXdDpQdDqZfKqYce41brlG5/5uKpGaoejXt/o1uy3k9cUfvcWcesJY
         T44w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R3Y1l59R0892E8CuX65FN56sFY81In0xM2oJbySffBA=;
        fh=D8uyZejLYHQtwUNKtY39iIwPBhb1j2MMTF98+RktrMk=;
        b=qUtx6KbMWMqD5mvCF8G9nlWuRYJQxZDmfTTAWqXreCue9e1Qjk8ogLKJyIxwIWryUp
         lM+gAKtKUc0UloklmNaUc547H1yMqwOgog2H4lcwYott8H0S1NpyqDh+hcuyv0gtyAWD
         6+gZ1up8WjWC+80KO4O5GbJp3h2cydzuLkS0O4WzurcnuD7UwjGOWwpeg5Hmvejf55Qu
         h4Akl62T1yZ6VRzqPisqHNuZWG8ISbBoKrCuokUFpQg4k9asU/AN1hRMJtQCzeP8C8r9
         y5Z5mhq9v7dI+ej5ocSqLDQbsE0rIeecJI09tCLYx7oUJygI+7QLANoqAoyZptEZ/cs1
         4ZmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MsyJp8AA;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a77dc08db45sor1418866b.5.2024.07.05.03.04.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Jul 2024 03:04:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MsyJp8AA;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173883; x=1720778683; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3Y1l59R0892E8CuX65FN56sFY81In0xM2oJbySffBA=;
        b=MsyJp8AAx0LOWeQKLRAofxqH1h9F17s39p7CsCMAuj3hsG7XxvK5klBz8ReoVb2oEI
         hhqV1r2l+o5q/QJVVEulGLhmYXeG1ay+95Y3zrVmDofva2mNuUAUbGk5tuwmyiOOYaiO
         hzZ0edCIH6+8BkTdo+hX6n1S0qxPnD3unBEzum3Z+Dt8TjCJYEuqRaDlHQgM0C0nfKXs
         HR250qiEikHDPCS4Q06cnERhNpU5RJWu6E0oY79p5MRweA6daMCSJe77a2X/xqi3ZskE
         kiPzSdwJlks6d3DlJiWVLHb5exC0/DD467JXEyZ/5fCePK8YAImIAeRpG+4SPm4gXN1S
         9rLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173883; x=1720778683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3Y1l59R0892E8CuX65FN56sFY81In0xM2oJbySffBA=;
        b=U93msxFVGLSoURVOYow+IEi4PrvszALFkcE3KqjOM19/xGeZ7Q5HSh9jH/Vqg8PpUp
         jFEKKuRD6nYny7hyA0vYMi6COYBUQ/bsZX0BsDjnctJ+T3jJ1UKWz/6eTMASGpxXSexG
         EIJ6x6bS9ie1BlsKWE1372og0OS3MX7pnNiUH2sYBrapl3GhTZ+fPPwQn1gPmh5MAw5u
         Jb8mMlJP+i+QY1aBnzBvPyjASIQFfWZPXEzu6UeHXDIignOljxZxvpH1fgAEAZ6Og+C5
         rk4+p/KrE8oOtnEIXojsVTs640cWz28HGHcui268xglFj33gvqM3LaPDNq7/BP1dq7Nl
         vWwQ==
X-Gm-Message-State: AOJu0YwxPdw2XNAXl8J7+LvPFBcq1e3z+ty+Khluo+KWZmxpdL/fxKfz
	1qr/0eh4umYxO6RrhJ8g6B4nJf/dQJI379apNib82SYam9xfL4IrTnTalIpn2A/GKN0wmfAtpsr
	j9LgH12HuTuPjd88cdGbbrKdYKkdzlUrmXh6cyl5mgBeDcfHjBzeRmAFK
X-Google-Smtp-Source: AGHT+IHQ+gVmBeuwnYzWbbeYUWr5kYu9VhHHxD7OPTfiUWSFi7lkrVDjaUbDYjPrS7b2/+5eikgq0toiLhXDS88cVEc=
X-Received: by 2002:a17:907:7843:b0:a77:c976:2987 with SMTP id
 a640c23a62f3a-a77c97634c7mr118229466b.29.1720173882575; Fri, 05 Jul 2024
 03:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240705084047.857176-1-alex.bennee@linaro.org> <20240705084047.857176-26-alex.bennee@linaro.org>
In-Reply-To: <20240705084047.857176-26-alex.bennee@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 5 Jul 2024 13:04:26 +0300
Message-ID: <CAAjaMXboPhzYrpkJmrPe=meiMM2Y02wfNoC_SJ5vfH0H2MkGEg@mail.gmail.com>
Subject: Re: [PATCH v2 25/40] plugins/lockstep: mention the one-insn-per-tb option
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
	Beraldo Leal <bleal@redhat.com>, David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, Alexandre Iooss <erdnaxe@crans.org>, 
	Thomas Huth <thuth@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
	Aleksandar Rikalo <arikalo@gmail.com>, Mads Ynddal <mads@ynddal.dk>, Yanan Wang <wangyanan55@huawei.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paul Burton <paulburton@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ceArKdjey8Ee

On Fri, 5 Jul 2024 at 11:48, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> This really helps with lockstep although its super slow on big jobs.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  contrib/plugins/lockstep.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
> index 761bcdf363..353bf12dfb 100644
> --- a/contrib/plugins/lockstep.c
> +++ b/contrib/plugins/lockstep.c
> @@ -14,7 +14,8 @@
>   * particular run may execute the exact same sequence of blocks. An
>   * asynchronous event (for example X11 graphics update) may cause a
>   * block to end early and a new partial block to start. This means
> - * serial only test cases are a better bet. -d nochain may also help.
> + * serial only test cases are a better bet. -d nochain may also help
> + * as well as -accel tcg,one-insn-per-tb=3Don
>   *
>   * This code is not thread safe!
>   *
> --
> 2.39.2
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
