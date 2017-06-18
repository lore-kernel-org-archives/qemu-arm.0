Received: by 10.25.0.23 with SMTP id 23csp499502lfa;
        Sun, 18 Jun 2017 07:41:15 -0700 (PDT)
X-Received: by 10.28.191.29 with SMTP id p29mr11695311wmf.60.1497796875458;
        Sun, 18 Jun 2017 07:41:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497796875; cv=none;
        d=google.com; s=arc-20160816;
        b=qNjuTa+89LpSbN3zZun6Inpu3MbDivNpJTmxt+EjP8QgaUQJ+mWaUVke9P63Lwjbts
         r7dyY1JSvWANxB62OJYAJ8/aXBFKhHuL+UTuASgONUOYf/afB4FY2wiwpHBOdAUeYeak
         0wfkt6sZqz5V6X+hvjxyEhtVZFw/+1ImbeTEnQrOc/q2xnnle4KlaZvow3ZkPEkRZnoV
         5nQRjLAuE/5W/AVGEQVWR9Akfjbp9dSBxJ4MCZFRkzEsjtcmYjw3iNqoJvuGmjDK6Uf4
         TnC7M/FsKsboCFPp7ZTgmkF+G7/QkomMq8rXxWgvOdg/cFPkZ/mZEky1Oyq80rfylEhY
         6BWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:mail-followup-to:references:subject:cc:to:from
         :arc-authentication-results;
        bh=9yAdb/YwK4C6Z62WXaGQV3/ceRQjSy2nSKR+0kstNkU=;
        b=gS+Pxve1fKc0b9ldmJK+ZZna0WkBo3xUzcipRRmj6Xb1q5Wu6yPVDHeo6TstH0yD6Y
         Nz4vTSH88Y12aXHQs0MjMARSW3Xx58VsnpUfLWDAL49wiuiz/4j62MXEQU4M0tWB1bkV
         YCEptEe97KpO6Ns8+HwmXFKk+GM07BdWr4xtaxFKQvJ4P7eXzH2nPRs5J8UKV9s/YwOB
         XzeIrdps+4Lc6bXu7G8zV8ZH4B6A/a3XPAk0+Je+vqTx3ja+91+K/8vNOQnYC+9e2fAG
         o0y8aITvduMZh17gHqdCwdvhGorxDIJzvD7ll2eQvm+ddt0ygE7kL0WZM6/26nETsjhN
         fWIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id v15si7688951wrc.121.2017.06.18.07.41.15;
        Sun, 18 Jun 2017 07:41:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5IEf9J2024786;
	Sun, 18 Jun 2017 16:41:09 +0200
Received: from localhost (unknown [132.68.53.205])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 0824C3BD;
	Sun, 18 Jun 2017 16:41:03 +0200 (CEST)
From: =?utf-8?Q?Llu=C3=ADs_Vilanova?= <vilanova@ac.upc.edu>
To: "Emilio G. Cota" <cota@braap.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
        Peter
 Crosthwaite <crosthwaite.peter@gmail.com>,
        "open list\:ARM"
 <qemu-arm@nongnu.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson
 <rth@twiddle.net>
Subject: Re: [Qemu-devel] [PATCH v6 6/6] target: [tcg, arm] Port to generic translation framework
References: <149727922719.28532.11985025310576184920.stgit@frigg.lan>
	<149727927074.28532.17986481795216498698.stgit@frigg.lan>
	<20170616001842.GA25056@flamenco>
Mail-Followup-To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, "open list\:ARM" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?=
	<alex.bennee@linaro.org>, Richard Henderson <rth@twiddle.net>
Date: Sun, 18 Jun 2017 17:41:02 +0300
In-Reply-To: <20170616001842.GA25056@flamenco> (Emilio G. Cota's message of
	"Thu, 15 Jun 2017 20:18:42 -0400")
Message-ID: <87mv95cq9t.fsf@frigg.lan>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 1Afg3CaH8NJs

Emilio G Cota writes:

> On Mon, Jun 12, 2017 at 17:54:30 +0300, Llu=C3=ADs Vilanova wrote:
>> Signed-off-by: Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>
>> ---
>> target/arm/translate-a64.c |  346 ++++++++++-----------
>> target/arm/translate.c     |  720 ++++++++++++++++++++++----------------=
------
>> target/arm/translate.h     |   46 ++-
>> 3 files changed, 560 insertions(+), 552 deletions(-)

> This one makes my arm-softmmu hang while booting debian. The last line
> I see is:

>> Freeing unused kernel memory: 300K (80669000 - 806b4000)

> Note that this happens even after disabling goto_ptr, so it shouldn't
> be related to that feature.

> The problem might be with the rebase. For instance, the
> hunk below was modified by commit 542b3478a ("armv7m: Replace armv7m.hack
> with unassigned_access handler"). Might be a good idea to go over
> the latest changes to arm/translate.c. What commit was your last working
> version based on?

I didn't write it down on the series docs, so I don't really know. I'll bre=
ak
the patch down into multiple as you suggested, and review them manually to =
see
if I'm able to catch the error (all the exit reason code is quite burdensom=
e to
port to the new infrastructure).

Is there any ready-made kernel or disk image I can test with?


Thanks,
  Lluis
