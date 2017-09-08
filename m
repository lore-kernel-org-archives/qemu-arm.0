Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id p71sm1084739wmd.40.2017.09.08.06.49.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Sep 2017 06:49:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 48D543E00A6;
	Fri,  8 Sep 2017 14:49:29 +0100 (BST)
References: <20170817230114.3655-1-richard.henderson@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 0/8] TCG vectorization and example conversion
In-reply-to: <20170817230114.3655-1-richard.henderson@linaro.org>
Date: Fri, 08 Sep 2017 14:49:29 +0100
Message-ID: <87zia5gv12.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: Q41lxmXfIzbZ


Richard Henderson <richard.henderson@linaro.org> writes:

> When Alex and I started talking about this topic, this is the direction
> I was thinking.  The primary difference from Alex's version is that the
> interface on the target/cpu/ side uses offsets and not a faux temp.  The
> secondary difference is that, for smaller vector sizes at least, I will
> expand to inline host vector operations.  The use of explicit offsets
> aids that.
<snip>

OK I think this is a lot more complete than my pass. I'm done with my
review for now, I look forward to the next version. It looks like most
of the pre-requisites are merged now?

--
Alex Bennée
