Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3120573wru;
        Fri, 3 Aug 2018 04:32:48 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc0kzAd79o04OX1u9k4w/PAgh6Cc7oeUdt6qQgoi4JJKmT4sEqIM/T9EQIehbp4sacdgRoV
X-Received: by 2002:a54:4f94:: with SMTP id g20-v6mr2938491oiy.130.1533295968261;
        Fri, 03 Aug 2018 04:32:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533295968; cv=none;
        d=google.com; s=arc-20160816;
        b=h2Nqecgu+xPGClrgMV6WqLx+EofdUEuvucClDrrqYDJ67x5UA1ohVz6J0RWT06gRSy
         +WW4di8H6MjyVLGembe/L5EPqS5DUYhfJb3fwqn7L9W9tzyfSD138cmekynTXS1tICeR
         WCGZ01NnvEfLqvgsDTlqr5MaQuFyQ+byUfxkwxpL0vV7tAJAulZ2NEF3v34Ijn3gnrKM
         RDClpuGGbBUKoxfonjZlqJGbegmx/HbEAyC0NPORm5Z6n2J3Zfvvsz2O8e22MSFG3z5C
         o7xwv4XOfcCWFo7PuAnrSxLrjte67JkZ6vJFndVKYdE3wfsJ5PETeT33rXUrIHp2cz3+
         QbvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:date:subject:cc:mail-followup-to
         :to:from:arc-authentication-results;
        bh=1h0/wkm6HAC2WMyLDcYL+KZifVu2LvaVZseNDHnrX8s=;
        b=bDDmIMqbglDs4r2IE/4sb10Ncn6tjdHrNvQuoUO0uTheWtgl+Umr5wkgJQKubtz+9d
         nnAWdgLF9JgJ4oTdixCSk0VCgzQH0JlW+Q1NVkggmIIuAannDmhT/otaeRqN/vgIYBTa
         13sMUqgu5uVipTIYfz6IT5g/ZrUQEikMlhR0iyvjW7QV+NzJmlT926CVNCnsclaSl2vA
         WEiuVmiV7efWOpQi+nt9IGeVPQvswEAjC7YwHd7t333cVJgVEUOwMPEuwoXIxP6zFMZQ
         nY1TxDGNPL9wc5ldSpKhcuCdqJDcVVNhuJrRWJetwc80r2pRWvi+fyvcdaEVcAtwKZWa
         lzvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of richard.sandiford@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=richard.sandiford@arm.com
Return-Path: <richard.sandiford@arm.com>
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id v135-v6si2950097oie.5.2018.08.03.04.32.48;
        Fri, 03 Aug 2018 04:32:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.sandiford@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of richard.sandiford@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=richard.sandiford@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F61E18A;
	Fri,  3 Aug 2018 04:32:47 -0700 (PDT)
Received: from localhost (unknown [10.32.98.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D99A3F5B3;
	Fri,  3 Aug 2018 04:32:46 -0700 (PDT)
From: Richard Sandiford <richard.sandiford@arm.com>
To: qemu-arm@nongnu.org
Mail-Followup-To: qemu-arm@nongnu.org,alex.bennee@linaro.org, richard.henderson@linaro.org, laurent.desnogues@arm.com, richard.sandiford@arm.com
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org, laurent.desnogues@arm.com
Subject: SVE LD1SH typo
Date: Fri, 03 Aug 2018 12:32:44 +0100
Message-ID: <87a7q38z37.fsf@arm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: LE+9sKGbWo1E

Hi,

There's a typo in sve_ld1hss_r: it's loading int8_ts rather than int16_ts.
(Sorry if it's already been reported.)

Hopefully GCC will provide coverage of this soon...

Thanks,
Richard
