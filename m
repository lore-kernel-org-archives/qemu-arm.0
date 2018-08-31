Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp346618wrd;
        Fri, 31 Aug 2018 01:42:42 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vdbf9+rR+cSYsZTTJGLnjvs5wYWe5lIrWonyjJXHcwlLEk2cG6PoHmrjA7yCOCdI0aYMII16
X-Received: by 2002:a37:168e:: with SMTP id 14-v6mr14505469qkw.168.1535704962429;
        Fri, 31 Aug 2018 01:42:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535704962; cv=none;
        d=google.com; s=arc-20160816;
        b=uVJnHyPYr5RXBwuFeLF/BqHnBGzFeTaTf+hgAl+A/c2LoHSs4fZ250mNumq851hBC1
         vA9B/TvNmJrx/j2V9/V9BxdkG2i4cJRSyk7AXXh/G0YT1X3wJKgv2AH7Ti8qI7NTrHat
         SWeB63SPpTU0yt9QSWEGzURiqURL5jYs987m162zHG7+un0PG0JXgTnVK0gRrpNWGz23
         dUt+Mka/DNAtK7yALbrSQlV+XwEiw65MD+Bukc9Elzuz+4pCqCMlpwMsjGi0ws3YWV9K
         u+VUW3/Wq2p/sSJO6Vwqn0iV6CfSXR8RFOSqrJFvSoRc5yXDYBJyilposSI1Nws7Vphe
         SlYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=JOAN1mtNqE0J3RWbVeWlHVM/nxHVN8L6LyMvknFa9AM=;
        b=aVrjZDv2y++i2rgoTxKUiNyHmg28jZMGTij0A08cp7pnP+prnNJuN4HYTc8pgpSzpt
         uWdnD9ljPK2BBcOj+poeY9VtTHUYQHeTSfunVD/g9wCDaVRiSFidxKNVhGwHUb8Qbec3
         xsl7nkfzliy/TOpgtavXvUgGYXvRjoV2swXDLqWtPS1T3rQzWJaIIKpwqTOfQ58muq5a
         NZtVeU69OEOde9pH5AdhPTkxPGSpOFPaLQPkqmtWvj3bw9OmaIWD2HKRvS+Ny0ctGHzr
         POHbrbUWRy8y7IlLycQhivatxAv+R49ebef1Nmn4TJAVWO8/3P4x3xEDT1bdAfezVczi
         pS8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id g1-v6si3953631qvq.179.2018.08.31.01.42.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Aug 2018 01:42:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EBCD740241DA;
	Fri, 31 Aug 2018 08:42:41 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8CBD2027EA0;
	Fri, 31 Aug 2018 08:42:40 +0000 (UTC)
Date: Fri, 31 Aug 2018 10:42:38 +0200
From: Andrew Jones <drjones@redhat.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180831084238.4cn3s27vwauq5fjl@kamzik.brq.redhat.com>
References: <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA9hivJzqksiSZbco4+EysYj=_y0t3k_L7TobxNPS8T2dQ@mail.gmail.com>
 <CAHmQWvC4Kp1CAeCe8ZTGtSeG7fnT=Xen4GFKfnhTBWUCJdQV+g@mail.gmail.com>
 <20180829134219.cmyqipnvukk6k2rp@kamzik.brq.redhat.com>
 <CAHmQWvA5t7zbbDDM0UvuKSL_Z8ey+x+vOGZumYjwsq0FC5AHGA@mail.gmail.com>
 <20180830083117.iekobw7l3arkt24m@bivouac.eciton.net>
 <CAFEAcA_s+9-4PYHyx_aAnxwt4e=VH77uBG7rC4JA++nOyjAaPw@mail.gmail.com>
 <20180830100233.nr6fm3npy57zl4xx@bivouac.eciton.net>
 <CAKv+Gu9r+1OBOSUBW_KpDEEoKyc=iwW4zVEe04-_JUnJtSGupQ@mail.gmail.com>
 <CAHmQWvAx8+_0vAOd_Pq0NVr5n0spYj8o5vsj1xjn+a1M81w=Lg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmQWvAx8+_0vAOd_Pq0NVr5n0spYj8o5vsj1xjn+a1M81w=Lg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Fri, 31 Aug 2018 08:42:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Fri, 31 Aug 2018 08:42:42 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-TUID: Dj8SDOdnJhny

On Fri, Aug 31, 2018 at 03:20:45PM +0800, Hongbo Zhang wrote:
> If no DT in SBSA machine, then the code had much more difference with
> virt, so there is possibility to make it a simple separate file;
> If keep same DT as virt, then there are more overlap with virt codes,
> so I am not sure how the patch should like finally, I still prefer
> separate file to keep virt untouched, but not sure if others would
> suggest to extract common codes to a third file, it is up to the
> maintainer and reviewers.
>

It sounds like you don't need many DT nodes, so a new file for
sbsa-ref, where you build whatever you want it to look like and
add the few DT nodes to inform firmware of a few parameters,
should be completely independent of mach-virt. I.e. I don't think
it even makes sense to refactor those few nodes in order to
share a tiny bit of DT node generation code.

Thanks,
drew
