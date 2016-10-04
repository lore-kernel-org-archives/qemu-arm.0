Received: by 10.80.163.71 with SMTP id 65csp2121836edn;
        Tue, 4 Oct 2016 06:43:26 -0700 (PDT)
X-Received: by 10.55.178.69 with SMTP id b66mr3878608qkf.146.1475588606524;
        Tue, 04 Oct 2016 06:43:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o134si2846135qke.64.2016.10.04.06.43.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Oct 2016 06:43:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42693 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brQ0D-0002Bm-OU
	for alex.bennee@linaro.org; Tue, 04 Oct 2016 09:43:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rutu.shah.26@gmail.com>) id 1brPgs-0001wi-WB
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 09:23:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rutu.shah.26@gmail.com>) id 1brPgs-0001I4-4l
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 09:23:26 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:34024)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rutu.shah.26@gmail.com>)
	id 1brPgo-0001BY-Ly; Tue, 04 Oct 2016 09:23:22 -0400
Received: by mail-wm0-x243.google.com with SMTP id b201so14522504wmb.1;
	Tue, 04 Oct 2016 06:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nXpQnjueS2TdZiRsecPfs6AOAC7NP8JAgLQvpTDx2e8=;
	b=UKNU1g7VvkWCLvELdh9MT1pZIH5wYQsi2B9YjdX3xVDcWLDmO/JWrO1HlKZx0AnwYI
	uxKVoIT1CUggmNBAhKBLRo1hl4KU+fGN9pLVIS3indvpgXxBq5FDz3vVzmNno+bKsLt9
	qFK43TioKDR1YVa0gqGHWIjEfxJ/5VXbo7mFAwoDF4RtVw4H7Ifuc8rhJTprHnkY3X3+
	F58Ztgy3pN63Gmwx3igQXYgnfTFgRhymxoGNZl6n5ZCyRz+kgFSXRRNe+gd0OhqySocq
	CjVIDuofjKrB7Spa/e1IbJaeCT5fFpo/+bFA2FCi+a5i90jbTxyCEBIHzbL87bYn8GUo
	38Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nXpQnjueS2TdZiRsecPfs6AOAC7NP8JAgLQvpTDx2e8=;
	b=TIhzpz2dClYWAxnLqbGrPfBvwMrePwbMUJTFTvQaaYp7B55pdkdN/uIiwUIGU1jzvZ
	3SwSbCg0gYOPqRpGsLk4dGeDGtdq4HTdJ18SyWLL2VWcobfkttoSYWrU20bMWbN4jsut
	RkrGfu3/ohT2a6s5BNlWhlTm9FZq+z4wjLrW5BzwEruCZSFyz9SlupCVjFEdgrZ1A3Rc
	uJRn+Ib+7UuxyQbZyfwF7uTegSZYso2MqFo59GZrlJmaHMS3kmd1c2AyrNZzfAC1G1jy
	QLyli8Nu0o015UrHYyHPWwQFbMVgXKPbdT+H7geaqfoPHJKg6+xIbOvYUCnvWPomjqbk
	gWkg==
X-Gm-Message-State: AA6/9RlpYUFSYTmBxrktjK8m+7e8paCY1IsHRLDCKIQzvGygr+2oY6CPARZHVD4kIv5i4uPdWfElO4UfczS2bA==
X-Received: by 10.194.94.101 with SMTP id db5mr1705220wjb.110.1475587400785;
	Tue, 04 Oct 2016 06:23:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.64.98 with HTTP; Tue, 4 Oct 2016 06:23:20 -0700 (PDT)
In-Reply-To: <20161003222617.GA11832@toto>
References: <1475513785-30275-1-git-send-email-rutu.shah.26@gmail.com>
	<CAFE_T+QzrfgGwSkqfbL6dArsSH_dyFREM=mma1sBeokO7gpX6Q@mail.gmail.com>
	<20161003222617.GA11832@toto>
From: Rutuja Shah <rutu.shah.26@gmail.com>
Date: Tue, 4 Oct 2016 18:53:20 +0530
Message-ID: <CAFE_T+SVu+vh1RMO08eCQgOYsLzhGW-9CU3KZ7FYtpWbWmVLeg@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-arm] [PATCH] Reducing stack frame size in
 stream_process_mem2s()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P4etEWABYFEw

Hi,
Allocating txbuf in struct Stream seems to be good. I can see other
pointers of struct Stream being allocated in xilinx_axidma_realize(),
but I am not able to find their deallocation point anywhere?
Regards
Rutuja Shah


On Tue, Oct 4, 2016 at 3:56 AM, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> On Mon, Oct 03, 2016 at 10:32:40PM +0530, Rutuja Shah wrote:
>> ++ stefan Sorry for the typo.
>> Regards
>> Rutuja Shah
>>
>>
>> On Mon, Oct 3, 2016 at 10:26 PM,  <rutu.shah.26@gmail.com> wrote:
>> > From: Rutuja Shah <rutu.shah.26@gmail.com>
>> >
>> > This patch allocates memory for txbuf array on the heap rather than the stack.
>> > As a result, the stack frame size is reduced.
>> >
>> > Signed-off-by: Rutuja Shah <rutu.shah.26@gmail.com>
>> > ---
>> >  hw/dma/xilinx_axidma.c | 4 +++-
>> >  1 file changed, 3 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
>> > index b135a5f..6c63575 100644
>> > --- a/hw/dma/xilinx_axidma.c
>> > +++ b/hw/dma/xilinx_axidma.c
>> > @@ -256,13 +256,14 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
>> >                                   StreamSlave *tx_control_dev)
>> >  {
>> >      uint32_t prev_d;
>> > -    unsigned char txbuf[16 * 1024];
>> > +    unsigned char *txbuf;
>> >      unsigned int txlen;
>> >
>> >      if (!stream_running(s) || stream_idle(s)) {
>> >          return;
>> >      }
>> >
>> > +    txbuf = g_malloc(16 * 1024);
>
> Hi,
>
> Two comments.
>
> We need to move the allocation from the data-path to initialization of the DMA objects. (e.g put txbuf into the Stream struct)
> We also need to fix up the use of sizeof txbuf.
>
> Best regards,
> Edgar
>
>
>> >      while (1) {
>> >          stream_desc_load(s, s->regs[R_CURDESC]);
>> >
>> > @@ -304,6 +305,7 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
>> >              break;
>> >          }
>> >      }
>> > +    g_free(txbuf);
>> >  }
>> >
>> >  static size_t stream_process_s2mem(struct Stream *s, unsigned char *buf,
>> > --
>> > 1.9.1
>> >
