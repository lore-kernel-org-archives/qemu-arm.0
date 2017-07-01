Received: by 10.25.227.6 with SMTP id a6csp368282lfh;
        Sat, 1 Jul 2017 15:44:34 -0700 (PDT)
X-Received: by 10.237.54.71 with SMTP id e65mr20054263qtb.146.1498949074563;
        Sat, 01 Jul 2017 15:44:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498949074; cv=none;
        d=google.com; s=arc-20160816;
        b=wjdc5anDci87KRLocpTF/93ngjlLZQQZB8/E7cBG08zld1zX+4QdLV+8Mm4VMrQ1YQ
         38pTPFaDpAt3ZbeAzoikHOUhb52ZqDkNbEpO89gu9fPe21jIk0IMnkedJUfhNJ0R04Dd
         bgex4xL4wpcpALvW3mVhIYLT7NxEfOIvxL55XUmDVl22KdFO1rUJ1+vp6KpSTP7eWSpj
         9PNCGaLw1ZXtZBIt7oleOBZ7rWRrEUBVDFjQ1TME/J5qNstuOcGiPuYBx6ce+p7dkE9i
         hWXIY7LfRMJZcORL+Rvq/GObpNcMld0gqEPC4EXijsDdUd263cFLVk2zs0zHE3apoOhA
         rX5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=wlURbFrlPuuezu376ncD8CY1o4tONM41WCqNNTXuyMk=;
        b=kWvC1KCjKAU2u+dsajZFvTfskKJ4e8ro+GcI6+z2aOUSIF8W2Mi9IyvLzVRj0TH1RV
         R+fuWdO66+LG8gmgk74LnKpM+AWo7WpqS+D+tYisBKMb+rBhUbVICa3HI7qF7BXVcMu9
         QamEC9wYuHkZ9fJIaz/URnMfVJNkW+EJomwkz7iXXKrE4nFYFhamspHgIN9OE5hd5hGk
         HdFYwwcmh9pNjvzflxyPOpP/lnEAcbLMPf2T0Ffj0hNaTOW3GfvfIh0KfkfjnNl4WCK9
         NT9hwkN+rM3fCAWf44vrrYL3PGCMUa/yvJ56XRFLEfdp/v6syFQm0hEW1nga4c38DAW2
         LD7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=i/NEwPY/;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com. [2607:f8b0:400d:c0d::242])
        by mx.google.com with ESMTPS id q17si11060023qtb.129.2017.07.01.15.44.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 15:44:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) client-ip=2607:f8b0:400d:c0d::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=i/NEwPY/;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x242.google.com with SMTP id m54so16907039qtb.1;
        Sat, 01 Jul 2017 15:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wlURbFrlPuuezu376ncD8CY1o4tONM41WCqNNTXuyMk=;
        b=i/NEwPY/MH18GcbzPKKPKkYzdJh19TT6X/Rc0LB6cf02kgPC3Log2POmmcw+j6IV7I
         R32gqQwy7sLgLnbvT7HgLbm5g6M7jDa4TmPAkUwMuQPYbXqL3NQtn2vigDTKIyexeLOG
         Qrsyp1USlnI53NEnLOMjgpsW4Yq5LAfBmvIvsZSB7n1JN/0M/FD4QHd5Oh36pNPS/pUa
         k1sLZ9hXgMx79IyvcIuRoXsHbpMmoqHHNT4u194K0o4fDn8sYY64Jo+OcfYZkRA33jDp
         LKGscmTASZ0OhlL9QVf/BzH9jMB81GoBALFoXEqHFFZif3sRPY6yXm9edqMn3BClCz0I
         r+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wlURbFrlPuuezu376ncD8CY1o4tONM41WCqNNTXuyMk=;
        b=sg7Amb9pdBmoDFmMdNwYLjCqaUBNTJ+2i5mCwBwf/ibGSR3dUui7A8nzH4/oZv+c40
         NQ+ADoytupX6IxssRbhcM4o1JG2TSp1yRnnSLtt2pfq++KrVLyhjzljrxBlAD5Lj7kbK
         X72aP45jb4JTwBjif10+KsQdl0eYqt9SkienJTUAA7Nf/jzUVxP6i++1NWUt149stgYP
         LUtwGnmdN7v9aqTiNo3fw6ZjTX8TZUXIzPBRlO9371IwRLu9u1/0ymjxVQG2P7ZHIQvu
         bVEoc8C07CmG0IR98dFJ+am7yUov8dTVKlhA6ghGQ9AZQdTzMbAfx691WIuiSuF7ZJiT
         D3vw==
X-Gm-Message-State: AKS2vOzZdnl9/bGMbUIa8LQfJ/RwOYJbCFv94S1usPFGw2sdZY000vjW
	n+Sq2lUBdNvunQ==
X-Received: by 10.200.45.228 with SMTP id q33mr18772209qta.177.1498949074278;
        Sat, 01 Jul 2017 15:44:34 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id w46sm10105751qtw.28.2017.07.01.15.44.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 15:44:33 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 01/29] Pass generic CPUState to
 gen_intermediate_code()
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Alexander Graf <agraf@suse.de>, "Emilio G. Cota" <cota@braap.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost
 <ehabkost@redhat.com>, "open list:ARM" <qemu-arm@nongnu.org>,
 Yongbok Kim <yongbok.kim@imgtec.com>, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, "open list:PowerPC" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865244195.17063.11938084353514091141.stgit@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <84fef40a-7e4c-25b5-583f-fe151de06f51@twiddle.net>
Date: Sat, 1 Jul 2017 15:44:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <149865244195.17063.11938084353514091141.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: uAPuqnM0vgmX

On 06/28/2017 05:20 AM, Lluís Vilanova wrote:
> -void gen_intermediate_code(CPUArchState *env, struct TranslationBlock *tb);
> +void gen_intermediate_code(CPUState *env, struct TranslationBlock *tb);

Ought to change the argument name too.


r~
