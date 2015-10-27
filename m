Received: by 10.182.105.169 with SMTP id gn9csp1617161obb;
        Tue, 27 Oct 2015 04:07:43 -0700 (PDT)
X-Received: by 10.68.213.162 with SMTP id nt2mr27746326pbc.86.1445944063666;
        Tue, 27 Oct 2015 04:07:43 -0700 (PDT)
Return-Path: <p.fedin@samsung.com>
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com. [210.118.77.11])
        by mx.google.com with ESMTPS id sc6si61122054pac.7.2015.10.27.04.07.42
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 27 Oct 2015 04:07:43 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of p.fedin@samsung.com designates 210.118.77.11 as permitted sender) client-ip=210.118.77.11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of p.fedin@samsung.com designates 210.118.77.11 as permitted sender) smtp.mailfrom=p.fedin@samsung.com
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWV006UULKR4OA0@mailout1.w1.samsung.com>; Tue,
 27 Oct 2015 11:07:39 +0000 (GMT)
X-AuditID: cbfec7f5-f794b6d000001495-4a-562f5afb7b5e
Received: from eusync4.samsung.com ( [203.254.199.214])
	by eucpsbgm2.samsung.com (EUCPMTA) with SMTP id A8.81.05269.BFA5F265; Tue,
 27 Oct 2015 11:07:39 +0000 (GMT)
Received: from fedinw7x64 ([106.109.131.169])
 by eusync4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTPA id <0NWV0093CLKQOXC0@eusync4.samsung.com>; Tue,
 27 Oct 2015 11:07:39 +0000 (GMT)
From: Pavel Fedin <p.fedin@samsung.com>
To: 'Peter Maydell' <peter.maydell@linaro.org>,
 'QEMU Developers' <qemu-devel@nongnu.org>
Cc: "'Edgar E. Iglesias'" <edgar.iglesias@gmail.com>,
 'Peter Crosthwaite' <crosthwaitepeter@gmail.com>,
 =?UTF-8?Q?'Alex_Benn=C3=A9e'?= <alex.bennee@linaro.org>,
 'Paolo Bonzini' <pbonzini@redhat.com>
References: <CAFEAcA-s_hSQiLCkQDeX2rR12PcPx5yZ885yZy7C=ZWA5DDbTw@mail.gmail.com>
In-reply-to:
 <CAFEAcA-s_hSQiLCkQDeX2rR12PcPx5yZ885yZy7C=ZWA5DDbTw@mail.gmail.com>
Subject: RE: [Qemu-devel] proposal: new qemu-arm mailing list
Date: Tue, 27 Oct 2015 14:07:38 +0300
Message-id: <012d01d110a7$b1915690$14b403b0$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-index: AQFnQCx/j7T7xS+vOqHOddNFPYsWV59SzmtQ
Content-language: ru
X-Brightmail-Tracker:
 H4sIAAAAAAAAA+NgFvrOLMWRmVeSWpSXmKPExsVy+t/xa7q/o/TDDG63qFt0PGhgtHjWuo7V
	YuKWX+wW+7f9Y7WYc+YBi8Xx3h0sDmweO2fdZfe4c20Pm8eTa5uZPN7vu8oWwBLFZZOSmpNZ
	llqkb5fAlfH3zjPmgjMsFSfXXWdsYDzD3MXIySEhYCIxaX4jC4QtJnHh3nq2LkYuDiGBpYwS
	v5fMZIZwvjNKzFh7nRWkik1AXeL01w9gHSIC0RJbLs4CizMLnGGU+PyYCcQWEgiQ2Hb/AVgN
	p0CwxII7PWBxYQFbiY+fN7OD2CwCqhIT+m6B9fIKWEos+X2RGcIWlPgx+R4LxEx1iUnzFjFD
	2PISm9e8hbpaQWLH2deMEDcYSey9coMRokZEYtq/e8wTGIVmIRk1C8moWUhGzULSsoCRZRWj
	aGppckFxUnqukV5xYm5xaV66XnJ+7iZGSHR83cG49JjVIUYBDkYlHl6DCr0wIdbEsuLK3EOM
	EhzMSiK8gjr6YUK8KYmVValF+fFFpTmpxYcYpTlYlMR5Z+56HyIkkJ5YkpqdmlqQWgSTZeLg
	lGpgLFm/4aXG3YKzs7wLc1r3OqgqXwtJDP/Clr89TpQri9trQ/vp34GLvxslTvG+x2FkK3Pc
	VcjuZ7nYagUTo1jeJ2vL1+pYndsVfOZM6E0Za/kXGnc9/ze5nf13JGDKs9/G7BVcpvtuXCpt
	/rnkyGSF9ptfRR6/arhSL3dbMjhBf8av/cx2u49+U2Ipzkg01GIuKk4EAL4d50WKAgAA
X-TUID: IS4y/l7LHwPh

 Hello!

> The idea would be to get people to cc the
> list with their ARM related patches, so it would mostly act as
> a way for people to filter their mail to separate the ARM stuff
> out from the qemu-devel firehose.

 I also vote for it. The main qemu-devel traffic is quite high, and not everyone wants to get it.

> (Everything should still be cc'd to qemu-devel as well.)

 I would drop this requirement, except for stuff which could touch core functionality (qom, qobject).

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia

