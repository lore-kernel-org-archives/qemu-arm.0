Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4545740lfa;
        Mon, 2 Nov 2020 22:27:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyrdE5xTiyxTVP1FAPcJ/7Sm7yQRYYjzTKyy+RysOMSPrkRjwAyCeNkwYL+PWN7GFyk+M8
X-Received: by 2002:a17:906:ca93:: with SMTP id js19mr5626136ejb.124.1604384865673;
        Mon, 02 Nov 2020 22:27:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604384865; cv=none;
        d=google.com; s=arc-20160816;
        b=My94GMBOKVW3I/qf7BFmbU5yA4pbHOiRJgzvOxTXnz3PN5WB4DU2bNEKYiBxBagZD4
         tMTVbwWnKbTi/PQrA/I1W1zTe4cWtg2ugLx4j+YervTxUU/n2fUCPbfeZMwURGMEpX0c
         JH9YzakVJIyoem/gHAUM1dq1QjjMC9mHKrkJIzGqOkjC04bj+9yzsf1jYtvH4MwsBmGU
         +ZYFbFUc1O+TJRs3grnpFI9zV2cNFHTY39YKz1oy6ntNpoR1LZFhaMKJxYQbVl4zG18n
         60Lu+vyVVHvSB0w19j3eVRx6WOBSmnmZ+pwEMRb6kGcC5J7wuYaVz/oWNTlkzNA0d6y7
         xkHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=k3uNit64wra+1gEQyVBaBES7oo1xDoWHmAXkdcsfpNw=;
        b=K6B1eUaxLv/zo6CK9uKd0zz6qcE9URhyxToGm3NN3ACe+akiQsYLea3GRnQW9Do0ob
         CtgBGfpYse0HIeKrTGQ3gENl3eXIw0WfEZDQNW9o0h5BwnMeEE9RQiRKVzO+7I/wy5rT
         a6ZyHq1AvnsuaPESjZAczgksVFgs1Kd5LnJNGNcP6lfNmioRL2hfIERpdv8ZST/q88a5
         hcLHtUPoyGa2PPPRERCj3BBQq5epoXRKq1dCx4VRsPIlf763v3Js0jW//B+StJelXoP1
         R08s1GrMNNiZ9HvRE20fhmeDh5wKKpZ7+xBXFs2dSVWJLiwa4GuNcpdgdqhS9BXXYuVN
         Ffew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Vk/zNAJr";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id b17si8254156edw.47.2020.11.02.22.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2020 22:27:45 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Vk/zNAJr";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604384864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k3uNit64wra+1gEQyVBaBES7oo1xDoWHmAXkdcsfpNw=;
	b=Vk/zNAJrLzHI1blOctHC/Qk1Euzrk/kv0gMyArxBKIIjG/E8hTJIx4nJVgMKHnWabKk4j4
	gPbJGQn8h4WYDjG8LStAQeXHzP/rrdPUQOnsg7vyilla+qVttTmXFvHVlRpX2uxxP/Xy9m
	q2lYKmbT8qqKYKIDsE6yg/sQQ+WGme4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-qvxxDFsQNVOoY6VgMnap6Q-1; Tue, 03 Nov 2020 01:27:40 -0500
X-MC-Unique: qvxxDFsQNVOoY6VgMnap6Q-1
Received: by mail-wr1-f69.google.com with SMTP id j15so7423562wrd.16
        for <alex.bennee@linaro.org>; Mon, 02 Nov 2020 22:27:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k3uNit64wra+1gEQyVBaBES7oo1xDoWHmAXkdcsfpNw=;
        b=ELFcDog+Uq92AKdzmuB6aEni2sENLeoxNz7vvPpL9TFc7sOipbkREk8sTasEhcF6My
         nIkpOYGYeLxYg3VL4diivVxQbEh3SIuWHIy9Q00b4pPqvyD0r4Fr51M9aAx6q2N4UWsV
         aUNDJ8etZW6/vMHbnAH78eRDzTDmbx/JiM3y+f60EO3y/ymsWtN2h0hOCFhMFdyW4SVS
         EDXZTFZtW7fBHVEcJLHgyOVOSJ5eNHybDxhqY1NuXKhQwwjUKmCJpRqpTZSB0XN3k1Ss
         6T5socF6TA1IZ+GWANNuzLzzyISjgJ3L+GRmm0e1fypr5DLqn55sa0hGUbh16ajNOuKa
         a1cQ==
X-Gm-Message-State: AOAM5304u18RUuvauApcCvH6NnCCv31lxbR6GyCQBfs05/Kj7P4e6Bdw
	OqWQG9kabiQBuOUTiPDBo3XrYglM+KXSnevlp3NvNDpQWocscEYxyTJRkNhJghEmYWz10ns+mVv
	B9t2xOMM/UiHEkMQS
X-Received: by 2002:adf:ef0d:: with SMTP id e13mr23999517wro.24.1604384859447;
        Mon, 02 Nov 2020 22:27:39 -0800 (PST)
X-Received: by 2002:adf:ef0d:: with SMTP id e13mr23999489wro.24.1604384859314;
        Mon, 02 Nov 2020 22:27:39 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.234])
        by smtp.gmail.com with ESMTPSA id b5sm24113137wrs.97.2020.11.02.22.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2020 22:27:38 -0800 (PST)
Subject: Re: [PATCH-for-5.2? 2/5] tests/acceptance: Restore MIPS Malta
 multicore tests
To: "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: KONRAD Frederic <frederic.konrad@adacore.com>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-ppc@nongnu.org,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Fabien Chouteau
 <chouteau@adacore.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Rolnik <mrolnik@gmail.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, qemu-arm@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20201102144245.2134077-1-philmd@redhat.com>
 <20201102144245.2134077-3-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e196ae4b-7d47-8ec3-6b04-f7cab0628547@redhat.com>
Date: Tue, 3 Nov 2020 07:27:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201102144245.2134077-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 6uuMNHsXmcFg

On 11/2/20 3:42 PM, Philippe Mathieu-Daudé wrote:
> Since 42a052333a6 ("hw/misc/mips_cpc: Start vCPU when powered on")
> the multicore support of the MIPS Malta board has been fixed.
> 
> This reverts commit 61bbce96fe4c8e3a2b7df5a67ba7dc6ba418e54b.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/acceptance/machine_mips_malta.py | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/tests/acceptance/machine_mips_malta.py b/tests/acceptance/machine_mips_malta.py
> index 7c9a4ee4d2d..eea046141d6 100644
> --- a/tests/acceptance/machine_mips_malta.py
> +++ b/tests/acceptance/machine_mips_malta.py
> @@ -100,7 +100,6 @@ def test_mips_malta_i6400_framebuffer_logo_1core(self):
>          """
>          self.do_test_i6400_framebuffer_logo(1)
>  
> -    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>      def test_mips_malta_i6400_framebuffer_logo_7cores(self):
>          """
>          :avocado: tags=arch:mips64el
> @@ -110,7 +109,6 @@ def test_mips_malta_i6400_framebuffer_logo_7cores(self):
>          """
>          self.do_test_i6400_framebuffer_logo(7)
>  
> -    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>      def test_mips_malta_i6400_framebuffer_logo_8cores(self):

And this still doesn't work... :(
https://gitlab.com/philmd/qemu/-/jobs/826406235#L218
