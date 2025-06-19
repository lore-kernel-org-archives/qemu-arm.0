Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp258880njc;
        Thu, 19 Jun 2025 06:23:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8m2KUZWBjicKogm3fgqFuEBScrD7a/AsfogNSKVejbNwqr9ABtvh86r1eWfl1ihpBJWheqybk2arvKQ==@linaro.org
X-Received: by 2002:a05:6e02:1b03:b0:3dd:d90a:af30 with SMTP id e9e14a558f8ab-3de07d68529mr225506005ab.10.1750339404900;
        Thu, 19 Jun 2025 06:23:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750339404; cv=none;
        d=google.com; s=arc-20240605;
        b=TskOqq7pT1VZb+BXV3Xuo7fR/XULDQ95U4V0C1n2wP20efo3/d6H2YsxprGU6jGplE
         ZCgYUk1XakmyOzKFaHFpLK9lNNVdxjHnjgIEpJ8SdsmpASDqKYb0baOZPk6cLPY2dkXq
         u9ctwzE0AxbbGrMXt5WpuwnJoyvDxfuyLqsbBuKhUhbQeE+Mo0AD+RCIkQtgGOgzAatT
         tgSWUwd5Buo9tHmA9T3NtYyCG43dbGBkHrVkC/LjJEu7ViepWxncNMjf1FRMa5/I1316
         mlqIwe9q/y+hoFpOY0ct5yYmZ7w7/M9PMvISGtgMSYHE9Xxz10QlkB7jC0b4S8uSsPeB
         Nz0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z81gzf00YTkY/fBeXVt0/DuwssyllLL3hRkGPpJeRNY=;
        fh=qGJXn42yD/B7h9+DcKDCjgrffJyAU7Xi53tdROKrt5w=;
        b=EhhxbpeR8Pge8LkUQZGpyIHjRCPfp4KaLzXtf3BNEyZbAQJYE71p53RAPKylohNKxn
         rhmWG4lAul8AHq7tOwZfqbO3VReC2L7NKU46r26tftWaPNjmjgALU6C8Nkm8cJfMtzUD
         G9ZDJ7g65o5MPyOZ0erLAX2RpUWYLxHOMuH6/9EMBnsM2SDxngXsy3B49dxseeTZRoka
         EvjkyIq5qH0ORB/UVbVFFSOxabxGUWuKy9K0d2APz5RbEkm9HLbmLCy7sWyZp1o0LNxn
         vRiDfMfHvyEGDaknmaWWswiLhzxikXZ5vSLsLkohPdbROHbqQC+R3pztzLoPvYD8S2Os
         WjOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gh9RMpcb;
       spf=pass (google.com: domain of philippe.mathieu-daude@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu-daude@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philippe.mathieu-daude@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e9e14a558f8ab-3de326f9e89sor3998895ab.10.2025.06.19.06.23.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 06:23:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu-daude@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gh9RMpcb;
       spf=pass (google.com: domain of philippe.mathieu-daude@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu-daude@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750339404; x=1750944204; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z81gzf00YTkY/fBeXVt0/DuwssyllLL3hRkGPpJeRNY=;
        b=gh9RMpcb1AGSNz+e5IG9GL0KMjHwHgFd3vVEIkg7n9eTHRs3lNV734Fl/i1mSgJ80A
         1SzmL42BSSP+naDHTUmIBeAg4lzVAkaqgDGVdkVU3k1QCTGbw6/G58al/4BXAo0iSJMI
         JeyKNdEAZKujDz9mHITQ29jgJmWObOKBclVabU0sRs8UUswx5zCFurNgnP39NOouc8QC
         8Bn0vmUs7mvaZ4FokaohDgAC8VsEK2mZ7U8z9G7mslljPL8csn8xoFLgf/fTIcKy9fCw
         6qn5DaB+VMYYxMnJ50n9KFMkaP+gYpMCBEGNa1zTadBj5wHvkTurTA37M97bhEmd7mn6
         QTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750339404; x=1750944204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z81gzf00YTkY/fBeXVt0/DuwssyllLL3hRkGPpJeRNY=;
        b=GD16aoxoJEoJJHlMNjSIsg8i1bOtRv6D9r/3pj8crbxYT0wlUhGlYoMit9dS3lUdKW
         K6iUPJ8NLENyLHRABN1XpeA2oUrmcd0W3b1tOuyFDvKhZJkjQNK52JEt1Fh3ygDCLCAh
         +zFxydgKJZ1o/tKmvQ6hW9d1bb4m2SIO4XQ8GVYoYz0uX09XiJ+KVVPtqPfzTc0PV3LI
         LFJeTRz4S99qxCj+Jl9eTnhHO0JR7T75QcgzqDxWoi7y1gjwOh7aLYXJ4BUKMcegkVFl
         rxBapaGf7IHyQ7T8FtDjQpKtIedY3hMYl0sWBzIMxDjW0AEEmCt69L4y8+/p04Wh55Yk
         jtUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6yIHXooJlPkpuRxlSFfHzMglxuVPQM5L9/4jCqSLjoggnvkJD1w9d2ZLHpnEpeRJ1UDL1hQI5ZdDlQQ==@linaro.org
X-Gm-Message-State: AOJu0YwnTDyrKHPkM0FaABs/6xYuRyGlhClunltMujbSm2/rQ3RjpOHV
	TUmAXoUw7231f4rW0c23N11Rk+fHMQ38aBu6u5d/5Nv7qaiQ+tVWEans5ZNjymbze40UrzE5z46
	xl0ichI988ApeMmf3w8fqGX+RJul27dJPc3onTvBLccV+ygqgxIxzlKNOGQ9q
X-Gm-Gg: ASbGncss6ckicgCEYBbwCJZeBj/vj5TjYZkfOI4mlCjoe2ZJdeZC7HuXJwqGGXdiJYZ
	twRP8O9M0UZW1elt60l6DGHC+S3wfa5Z6GnUDZqXE1CmeNh//wzWud0PR0XNkEx6fTRGoitoLen
	2u7uFr+qrQb1tSeGyosQ8xpqMfX9iV5c7s4q2QswyZYdU=
X-Google-Smtp-Source: AGHT+IHQux5BONbs+biKWvdH17zMCmnmXk/I0BfEe5F7pA7ZT7bha/W1MD5B0EJhN7nBoWpSXTZ2SAgZoBHpYqMNd34=
X-Received: by 2002:a05:6e02:3304:b0:3dd:cc4f:d85a with SMTP id
 e9e14a558f8ab-3de07d12d0bmr241002825ab.6.1750339404384; Thu, 19 Jun 2025
 06:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250619131319.47301-1-philmd@linaro.org> <20250619131319.47301-21-philmd@linaro.org>
In-Reply-To: <20250619131319.47301-21-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Date: Thu, 19 Jun 2025 15:23:13 +0200
X-Gm-Features: AX0GCFtmRRy5I91doA1D2ea5i25Q9Xlua4nOtMjG5qC8LQzhcPW_VnpruYxsqJk
Message-ID: <CAPMQPEJTTa4NiEvj9pmrubyn3dTB=13PW6scive=nfAGVtqMHw@mail.gmail.com>
Subject: Re: [PATCH 20/20] tests/functional/sbsa-ref: Move where machine type
 is set
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>, Julian Armistead <julian.armistead@linaro.org>, 
	Radoslaw Biernacki <rad@semihalf.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Phil Dennis-Jordan <phil@philjordan.eu>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
	Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: a5kyFB7rEwJz

On Thu, 19 Jun 2025 at 15:15, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> fetch_firmware() is only about fetching firmware.
> Set the machine type in test_sbsaref_edk2_firmware().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  tests/functional/test_aarch64_sbsaref.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/functional/test_aarch64_sbsaref.py b/tests/functional/=
test_aarch64_sbsaref.py
> index e6a55aecfac..5536ec622e6 100755
> --- a/tests/functional/test_aarch64_sbsaref.py
> +++ b/tests/functional/test_aarch64_sbsaref.py
> @@ -40,7 +40,6 @@ def fetch_firmware(test):
>          with open(path, "ab+") as fd:
>              fd.truncate(256 << 20)  # Expand volumes to 256MiB
>
> -    test.set_machine('sbsa-ref')
>      test.vm.set_console()
>      test.vm.add_args(
>          "-drive", f"if=3Dpflash,file=3D{fs0_path},format=3Draw",
> @@ -70,6 +69,7 @@ def test_sbsaref_edk2_firmware(self):
>
>          fetch_firmware(self)
>
> +        self.set_machine('sbsa-ref')
>          self.vm.add_args('-cpu', 'cortex-a57')
>          self.vm.launch()

Sorry, last patch, I forgot to squash:

-- >8 --
diff --git a/tests/functional/test_aarch64_sbsaref_alpine.py
b/tests/functional/test_aarch64_sbsaref_alpine.py
index 6108ec65a54..98762eedb67 100755
--- a/tests/functional/test_aarch64_sbsaref_alpine.py
+++ b/tests/functional/test_aarch64_sbsaref_alpine.py
@@ -32,2 +32,3 @@ def boot_alpine_linux(self, cpu=3DNone):

+        self.set_machine('sbsa-ref')
         self.vm.set_console()
diff --git a/tests/functional/test_aarch64_sbsaref_freebsd.py
b/tests/functional/test_aarch64_sbsaref_freebsd.py
index 26dfc5878bb..1c243d0d459 100755
--- a/tests/functional/test_aarch64_sbsaref_freebsd.py
+++ b/tests/functional/test_aarch64_sbsaref_freebsd.py
@@ -32,2 +32,3 @@ def boot_freebsd14(self, cpu=3DNone):

+        self.set_machine('sbsa-ref')
         self.vm.set_console()
---
